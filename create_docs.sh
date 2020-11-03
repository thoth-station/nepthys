#!/bin/bash

set -ex

die() { echo "$*" 1>&2 ; exit 1; }

workdir=$PWD

rm -rf clones # thoth
mkdir -p thoth/
for repo in thamos adviser analyzer common lab package-extract python solver storages
do
    git clone --depth 1 https://github.com/thoth-station/${repo}.git clones/${repo}
    # Copy _templates to each repo for Google analytics functionality.
    if  [[ $GITHUB_COMMIT = "1" ]]; then
        cp -r _templates/ clones/${repo}/docs/source/
    fi
    pushd clones/${repo}
    pipenv install
    # Dirty hack due to deps issues.
    pipenv run pip3 install sphinx==2.2.2 sphinx-nameko-theme==0.0.3 sphinxcontrib-openapi==0.5.0

    if [[ "$repo" = "thamos" ]]; then
        # Thamos requires OpenAPI specification from User API.
        git clone --depth 1 https://github.com/thoth-station/user-api.git ../user-api
        pipenv run sphinx-apidoc -o docs/source thamos --implicit-namespaces
    else
        pipenv run sphinx-apidoc -o docs/source thoth --implicit-namespaces
    fi

    # Get rid of anying warning messages.
    mkdir -p docs/source/_static; rm docs/source/modules.rst

    # Update database schema image when generating docs for storage.
    if [[ "$repo" = "storages" ]]; then
        pipenv install --dev
        PYTHONPATH=. pipenv run python3 ./thoth-storages generate-schema schema.png
        cp -f schema.png docs/source/_static/schema.png
    fi

    pipenv run python3 setup.py build_sphinx
    # pipenv --rm
    popd
    mkdir -p thoth/${repo}/source
    cp -r clones/${repo}/build/sphinx/html/* thoth/${repo}
done


# NOTE: If GITHUB_COMMIT is set,then thoth-station.github.io will be updated.
if  [[ $GITHUB_COMMIT = "1" ]]; then
    # Config: Script commit files on behalf of
    git config --global user.name $GITHUB_USER
    git config --global user.email $GITHUB_USER_EMAIL
    rm -rf thoth-station.github.io
    git clone --depth 1 git@github.com:thoth-station/thoth-station.github.io.git
    rm -rf thoth-station.github.io/docs/developers/

    for repo in thamos adviser analyzer common lab package-extract python solver storages
    do
        mkdir -p thoth-station.github.io/assets/${repo}/
        mv thoth/${repo}/_modules/  thoth/${repo}/modules/|| true
        mv thoth/${repo}/_images/  thoth/${repo}/images/|| true
        mv thoth/${repo}/_sources/  thoth/${repo}/sources/|| true
        mv thoth/${repo}/_static/* thoth-station.github.io/assets/${repo}/ || true
        sed -i 's|_sources/|sources/|g' thoth-station.github.io/assets/${repo}/searchtools.js;
        pushd thoth/${repo}
        find -iname '*.html' -exec sed -i "s|_static/|/assets/${repo}/|g" {} \;
        find -iname '*.html' -exec sed -i 's|_modules/|modules/|g' {} \;
        find -iname '*.html' -exec sed -i 's|_images/|/assets/|g' {} \;
        find -iname '*.html' -exec sed -i 's|/images/|/assets/|g' {} \;
        find -iname '*.html' -exec sed -i 's|_sources/|sources/|g' {} \;
        find -iname '*.html' -exec sed -i 's|="[a-zA-Z/._]*/assets/|="/assets/|g' {} \;
        popd
    done

    mkdir -p thoth-station.github.io/docs/developers/
    cp -r thoth/* thoth-station.github.io/docs/developers/
    cd thoth-station.github.io
    git add .
    git commit -m "Routine Docs Update"
    git push origin master
fi

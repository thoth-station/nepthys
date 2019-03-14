#!/bin/bash

set -ex

die() { echo "$*" 1>&2 ; exit 1; }

workdir=$PWD

rm -rf clones thoth
mkdir -p thoth/
for repo in adviser analyzer common lab package-extract python solver storages; do
	git clone https://github.com/thoth-station/${repo}.git clones/${repo}
	pushd clones/${repo}
	pipenv install
	# Dirty hack due to deps issues.
	pipenv run pip3 install sphinx sphinx_py3doc_enhanced_theme
	pipenv run sphinx-apidoc -o docs/source thoth --implicit-namespaces
	# Get rid of anying warning messages.
	mkdir -p docs/source/_static; rm docs/source/modules.rst
	pipenv run python3 setup.py build_sphinx
	# pipenv --rm
	popd
	mkdir -p thoth/${repo}/source
	cp -r clones/${repo}/build/sphinx/html/* thoth/${repo}
done



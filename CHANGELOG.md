
## Release 0.3.2 (2021-11-09T14:48:43)
* Pin docutils

## Release 0.2.0 (2020-09-14T11:09:41)
### Features
* Fix serving static content in sphinx docs (#30)
* Do not comment out GH user
### Bug Fixes
* Make the generated documentation work with jekyll

## Release 0.2.1 (2020-09-18T08:23:13)
### Features
* Fix repo listing (#34)

## Release 0.2.2 (2020-09-23T08:16:14)
### Features
* Fix commit message on routine docs update (#37)

## Release 0.2.3 (2020-10-13T12:43:12)
### Features
* Fix assets location

## Release 0.2.4 (2020-10-15T06:10:17)
### Features
* Release of version 0.2.3 (#43)
* Fix assets location
* Release of version 0.2.2 (#39)
* Fix commit message on routine docs update (#37)
* Release of version 0.2.1 (#36)
* Fix repo listing (#34)
* Release of version 0.2.0 (#32)
* Fix serving static content in sphinx docs (#30)
* Do not comment out GH user
* :truck: include aicoe-ci configuration file
* :notes: include nepthys version handler
* :truck: include thoth yaml file for auto updates
* :jack_o_lantern: migrate manifest file to thoth-application
* Remove archived repositories (#22)
* Create OWNERS
* added a 'tekton trigger tag_release pipeline issue'
* Do not clone the whole history
* Add missing Python 3.6 on Fedora:31
* Use Fedora 31 as a base
* Use Fedora:30 as a base
* Hotfix for User API clone
* Add graphviz to visualize knowledge graph schema
* Add thamos to repository listing
* Generate database schema used in thoth-storages
* secret template for deployment
* :package: support build trigger for nepthys deployment
* Give job 30 minutes to finish
* Change sphinx theme
* Push directly to master to avoid GitHub GH pages publishing issue
* Add build-analyzers to generate docs
* Include package-analyzer in generated docs
* Add a space before heading
* Increase resources to address OOM issues
* feature to use google analytics on thoth-station.ninja
* Deploy nepthys on openshift and added pull request feature
* :sparkles: added standard project stuff
* Update implementation
* Fix grammar
* Initial project import
### Bug Fixes
* Make the generated documentation work with jekyll
*  fixing rerun of build as oc process on buildconfig starts build as well
* Zuul configuration is directly an object, not array of objects
### Improvements
* :truck: pipenv updates are not needed
* :8ball: make pre-commit happy
* Disable colors and spinner in Pipenv

## Release 0.2.5 (2020-11-04T19:07:42)
### Features
* :guardsman: update OWNERS
* utilize the workdir aspect in the dockerfile (#51)
* :turtle: include assets based on projects

## Release 0.2.6 (2021-01-12T16:49:05)
### Features
* unignore __init__.py explicitly under thoth/nepthys dir (#61)
* don't ignore the thoth/nepthys/__init__.py file changes (#58)
* bump python version (#55)

## Release 0.3.0 (2021-04-08T17:52:46)
### Improvements
* :robot: ci updates w.r.t prow, thoth and aicoe-ci (#66)
* Add investigator and messaging to the docs creation

## Release 0.3.1 (2021-04-09T10:48:07)
### Features
* Fix image location in the publish docs (#70)

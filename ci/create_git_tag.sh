#!/bin/bash
set -ev

if [ "$TRAVIS_BRANCH" == "master" ]; then    
  cd $TRAVIS_BUILD_DIR
  BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --cached --use-custom-manifest manifest.yml
  export VERSION=`cat VERSION`
  export DATE=`date +"%Y%m%d-%M%S"`
  mv swift_buildpack-cached-v$VERSION.zip buildpack_swift_v$VERSION-$DATE.zip
  git tag $VERSION -f
  git push https://$GITHUB_USER:$GITHUB_PASS@github.com/IBM-Swift/swift-buildpack.git --tags --force --quiet
fi

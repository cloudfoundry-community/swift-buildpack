#!/bin/bash

cd repo

BUNDLE_GEMFILE=cf.Gemfile bundle install
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --uncached --use-custom-manifest manifest.yml
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --cached --use-custom-manifest manifest-cached.yml

mkdir -p ../zips
mv *.zip ../zips

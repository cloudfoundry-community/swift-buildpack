#!/bin/bash

cd repo

BUNDLE_GEMFILE=cf.Gemfile bundle install
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --uncached

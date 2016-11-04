#!/bin/bash
##
# Copyright IBM Corporation 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

set -ev

VERSION=$1

if [ "$DEPLOY_FLAG" == "true" ]; then
  ASSETS_URL=`curl -u $GITHUB_USER:$GITHUB_PASS -i https://api.github.com/repos/IBM-Swift/swift-buildpack/releases/tags/$VERSION | grep assets_url | awk '{split($0,array,": ")} END {print array[2]array[3]}' | awk '{gsub(/"/, "", $1); print $1}' | awk '{gsub(",", "", $1); print $1}'`
  ASSETS_ID=`curl -u $GITHUB_USER:$GITHUB_PASS -i $ASSETS_URL | grep -m 1 url | awk '{split($0,array,": ")} END {print array[2]array[3]}' | awk '{gsub(/"/, "", $1); print $1}' | awk '{gsub(",", "", $1); print $1}'`
  if [ -n "$ASSETS_URL" ]; then 
    curl -u $GITHUB_USER:$GITHUB_PASS -X DELETE $ASSETS_ID
  else
    echo "No assets assigned to release yet."
  fi
else
  echo "Not deleting previous assets."
fi

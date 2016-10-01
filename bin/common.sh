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

error() {
  echo " !     $*" >&2
  exit 1
}

status() {
  echo "-----> $*"
}

protip() {
  tip=$1
  help_url=$2
  echo ""
  echo "PRO TIP: $tip" | indent
  if [[ "${2}X" != "X" ]]; then
    echo "Visit $2" | indent
  fi
  echo ""
  echo ""
}

# sed -l basically makes sed replace and buffer through stdin to stdout
# so you get updates while the command runs and dont wait for the end
# e.g. npm install | indent
indent() {
  c='s/^/       /'
  case $(uname) in
    Darwin) sed -l "$c";; # mac/bsd sed: -l buffers on line boundaries
    *)      sed -u "$c";; # unix/gnu sed: -u unbuffered (arbitrary) chunks of data
  esac
}

export_env_dir() {
  env_dir=$1
  whitelist_regex=${2:-''}
  blacklist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
  if [ -d "$env_dir" ]; then
    for e in $(ls $env_dir); do
      echo "$e" | grep -E "$whitelist_regex" | grep -qvE "$blacklist_regex" &&
      export "$e='$(cat $env_dir/$e)'"
      :
    done
  fi
}

set-env() {
  echo "export $1=$2" >> $PROFILE_PATH
}

download_dependency() {
  dependency_name=$1
  dependency_version=$2
  default_dependency_version=$3

  # Download and unpack dependency
  if [[ ! -d "$CACHE_DIR/$dependency_name" ]]; then
    status "Installing $dependency_name : $dependency_version"
    mkdir -p $dependency_name
    IF=' ' read -a dependency_info <<< $($compile_buildpack_dir/compile-extensions/bin/download_dependency $dependency_name.tar.gz /tmp $default_dependency_version)
    echo ${dependency_info[@]}
    if [[ ${dependency_info[1]} = "true" ]]; then
      echo "Cached $dependency_name" | indent
      CACHE_ARRAY+=($dependency_name)
    else
      echo "Downloaded $dependency_name" | indent
    fi
    # Determine unpack options
    if [[ "${dependency_info[0]}" == *gz ]]; then
      # Assuming tar.gz
      tar xz -C $dependency_name -f ${dependency_info[0]}
    else
      # Assuming tar.xz file
      echo ${dependency_info[0]} | xz -d -c --files | tar x -C $CLANG_NAME_VERSION &> /dev/null
    fi
  fi
}

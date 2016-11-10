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

join_by_whitespace() {
  echo "$*"
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
  # Current folder must be CACHE_DIR
  dependency_name=$1
  dependency_version=$2
  dependency_version_extension=$3
  default_dependency_version=$4
  dependency_filename=$dependency_name.$dependency_version_extension

  # Download dependency
  if [[ ! -e "$CACHE_DIR/$dependency_filename" ]]; then
    status "Getting $dependency_name"
    # Place dependency tar file in CACHE_DIR
    in_cache=$($compile_buildpack_dir/compile-extensions/bin/download_dependency $dependency_filename $CACHE_DIR $default_dependency_version)
    if [[ $in_cache = "true" ]]; then
      echo "Cached $dependency_name" | indent
      #CACHED_ITEMS+=($dependency_filename)
    else
      echo "Downloaded $dependency_name" | indent
    fi
  fi

  # Unpack dependency - determine unpack options
  status "Unpacking $dependency_filename"
  mkdir -p $dependency_name
  if [[ "$dependency_version_extension" == *gz ]]; then
    # Assuming tar.gz file
    tar xz -C $dependency_name -f $CACHE_DIR/$dependency_filename
  else
    # Assuming tar.xz file
    echo $CACHE_DIR/$dependency_filename | xz -d -c --files | tar x -C $CLANG_NAME_VERSION &> /dev/null
  fi
}

download_packages() {
  local packages=("$@")
  for package in "${packages[@]}"; do
    # Check if CACHE_DIR already contains DEB file for package
    if [ -f $APT_CACHE_DIR/archives/$package*.deb ]; then
      status "$package was already downloaded."
      # Remove element from array if DEB file already downloaded
      unset 'packages[${package}]'
      packages=("${packages[@]}")
      continue
    fi
  done

  if [ ${#packages[@]} -eq 0 ]; then
    status "No additional packages to download."
  else
    # Turn string array into a space delimited string
    packages="$(join_by_whitespace ${packages[@]})"
    status "Fetching .debs for: $packages"
    if [ "$APT_PCKGS_LIST_UPDATED" = false ] ; then
      apt-get $APT_OPTIONS update
      APT_PCKGS_LIST_UPDATED=true
    fi
    apt-get $APT_OPTIONS -y --force-yes -d install --reinstall $packages | indent
    status "Downloaded DEB files..."
  fi
}

install_packages() {
  for DEB in $(ls -1 $APT_CACHE_DIR/archives/*.deb); do
    status "Installing $(basename $DEB)"
    dpkg -x $DEB $BUILD_DIR/.apt/
  done
}

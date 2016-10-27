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

join_by_whitespace() {
  #echo "HEHEHEHEHEH"
  echo "$*"
  #echo "HAHA"
}

install_packages() {
  packages=("$@")
  # Turn array into a space delimited string
  packages="$(join_by_whitespace ${packages[@]})"
  #join_by_whitespace "${packages[@]}"
  echo "PACKAGES TO INSTALL ARE: $packages"
}

packages=("libicu-dev" "libcurl4-openssl-dev")
install_packages "${packages[@]}"

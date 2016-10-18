create_swift_signature() {
  echo "$(swift --version)"
}
create_packages_signature() {
  echo "$(cat $BUILD_DIR/Package.swift)"
}

save_signatures() {
  echo "$(create_swift_signature)" > $CACHE_DIR/swift/.swift-signature
  echo "$(create_packages_signature)" > $CACHE_DIR/swift/.package-signature
}

load_swift_signature() {
  if test -f $CACHE_DIR/swift/.swift-signature; then
    cat $CACHE_DIR/swift/.swift-signature
  else
    echo ""
  fi
}

load_packages_signature() {
  if test -f $CACHE_DIR/swift/.package-signature; then
    cat $CACHE_DIR/swift/.package-signature
  else
    echo ""
  fi
}

get_cache_status() {
  if ! ${SWIFT_PACKAGE_CACHE:-true}; then
    echo "disabled by config"
  elif [ "$(create_swift_signature)" != "$(load_swift_signature)" ]; then
    echo "new swift signature"
  elif [ "$(create_packages_signature)" != "$(load_packages_signature)" ]; then
    echo "new package signature"
  else
    echo "valid"
  fi
}

restore_cache_directories() {
  local build_dir=${1:-}
  local cache_dir=${2:-}

  for cachepath in ${@:3}; do
    if [ -e "$build_dir/$cachepath" ]; then
      echo "- $cachepath (exists - skipping)"
    else
      if [ -e "$cache_dir/swift/$cachepath" ]; then
        echo "- $cachepath"
        mkdir -p $(dirname "$build_dir/$cachepath")
        mv "$cache_dir/swift/$cachepath" "$build_dir/$cachepath"
      else
        echo "- $cachepath (not cached - skipping)"
      fi
    fi
  done
}

clear_cache() {
  rm -rf $CACHE_DIR/swift
  mkdir -p $CACHE_DIR/swift
}

save_cache_directories() {
  local build_dir=${1:-}
  local cache_dir=${2:-}

  for cachepath in ${@:3}; do
    if [ -e "$build_dir/$cachepath" ]; then
      echo "- $cachepath"
      mkdir -p "$cache_dir/swift/$cachepath"
      cp -a "$build_dir/$cachepath" $(dirname "$cache_dir/swift/$cachepath")
    else
      echo "- $cachepath (nothing to cache)"
    fi
  done
}

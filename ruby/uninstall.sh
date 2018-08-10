#!/bin/bash
# --------------------------------------------------------------------------
# Un-install any rubies not currently in use
# --------------------------------------------------------------------------

RUBIES=`cat ~/.my-ruby-versions`
INSTALLED=`find ~/src -name "ruby*" -type d -d 1 | awk -F\- '{print $2}'`

containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

# Remove any ruby versions not specified
for version in ${INSTALLED[@]}
do

  echo -n "Checking ${version} ..."
  if containsElement ${version} ${RUBIES[@]} ; then
    echo "skipping"
  else
    echo "removing"
    rm -Rf ~/src/ruby-${version}*
    rm -Rf ~/.rubies/ruby-${version}*
    rm -Rf ~/.gem/ruby/${version}
  fi

done

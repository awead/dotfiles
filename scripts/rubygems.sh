#!/bin/bash
# --------------------------------------------------------------------------
# Check and re-establish rubygems.org credentials
# --------------------------------------------------------------------------

update_credentials () {
  read -p "Email for rubygems.org:" EMAIL
  curl -u $EMAIL --silent https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials
  chmod 0600 ~/.gem/credentials
}

update_status () {
  if [ -f ~/.gem/credentials ]; then
    KEY=`grep rubygems_api_key ~/.gem/credentials | awk '{print $2}'`
    STATUS=`curl --write-out %{http_code} --silent -H "Authorization:${KEY}" --output /dev/null https://rubygems.org/api/v1/gems.json`
  else
    STATUS="401"
  fi
}

check_status () {
  echo -n "Checking rubygems credentials..."
  update_status
  if [ ${STATUS} -eq 200 ]; then
    echo "we're good!"
  else
    echo "nope."
  fi
}

check_status
while [[ ${STATUS} -gt 200 ]]; do
  update_credentials
  update_status
  check_status
done

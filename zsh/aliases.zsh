# Aliases
alias ls='ls -Gh'
alias d2='wine .wine/drive_c/Program\ Files/Diablo\ II/Diablo\ II.exe'
alias d2nt='wine .wine/drive_c/Program\ Files/D2NT/D2NT\ Manager.exe'
alias nuke-rockets="git grep -l '=>'| xargs perl -pi -e 's/(?<!:):(\w+)\s?=>\s?/$1: /g'"
alias firefox="~/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias killall-resque="ps -ax | grep resque | awk '{ print $1 }' | xargs kill -s KILL"
alias killall-spring="ps -ax | grep spring | awk '{ print $1 }' | xargs kill -s KILL"
alias git-log-pretty='git log --pretty=format:" %cd : %s [%cn]" --date=short'
alias be-rspec='bundle exec rspec'
alias be-rake='bundle exec rake'
alias be-r='bundle exec rubocop'
alias be-ra='bundle exec rubocop -a'
alias date-iso-8601='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias eject-data='hdiutil eject /Volumes/Data'
alias psu-libraries='cd ~/Projects/Github/psu-libraries'
alias cho='cd ~/Projects/Github/psu-libraries/cho-req'
alias psu-stewardship='cd ~/Projects/Github/psu-stewardship'
alias ss='cd ~/Projects/Github/psu-stewardship/scholarsphere'
alias g='git status'

# Dev shortcuts
alias fcrepo-start="bundle exec fcrepo_wrapper --config ~/.fcrepo_wrapper > /dev/null 2>&1 &"
alias solr-sufia-test="bundle exec solr_wrapper --config .internal_test_app/config/solr_wrapper_test.yml > /dev/null 2>&1 &"
alias solr-sufia-dev="bundle exec solr_wrapper --config .internal_test_app/.solr_wrapper > /dev/null 2>&1 &"
alias solr-dev="bundle exec solr_wrapper --config .solr_wrapper > /dev/null 2>&1 &"
alias solr-test="bundle exec solr_wrapper --config config/solr_wrapper_test.yml > /dev/null 2>&1 &"
alias resque-pool-start="bundle exec resque-pool -E development start"

# Chrome
alias chrome="~/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="~/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="~/Applications/Chromium.app/Contents/MacOS/Chromium"

# Postgres
alias pg-start="pg_ctl -D $PG_HOME -l $PG_HOME/server.log start"
alias pg-stop="pg_ctl -D $PG_HOME stop -s -m fast"

# Aliases
alias ls='ls -Gh'
alias firefox="~/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias be-rspec='bundle exec rspec'
alias be-rake='bundle exec rake'
alias be-r='bundle exec rubocop'
alias be-ra='bundle exec rubocop -a'
alias date-iso-8601='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias eject-data='hdiutil eject /Volumes/Data'
alias dotfiles='cd ~/.dotfiles'
alias tmux="TERM=screen-256color-bce tmux"
alias tls="tmux ls"
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias autocop="bundle exec rubocop -P -f fi | xargs bundle exec rubocop -a"
alias plistbuddy="/usr/libexec/PlistBuddy"
alias k="kubectl"
alias dc="docker-compose" # NB: this overrides /usr/bin/dc which is a calculator program

# Github repos
alias psu-libraries='cd ~/Projects/Github/psu-libraries'
alias ss='cd ~/Projects/Github/psu-libraries/scholarsphere'
alias catalog='cd ~/Projects/Github/psu-libraries/psulib_blacklight'
alias traject='cd ~/Projects/Github/psu-libraries/psulib_traject'
alias metadata-listener='cd ~/Projects/Github/psu-libraries/metadata-listener'
alias s-config='cd ~/Projects/Github/psu-libraries/scholarsphere-config'
alias s-client='cd ~/Projects/Github/psu-libraries/scholarsphere-client'
alias rmd='cd ~/Projects/Github/psu-stewardship/researcher-metadata'

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

# Git
# Note: Most of these are to override the zsh git plugin
# See: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
alias g='git status'
alias gb='git recent'

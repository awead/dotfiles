# Functions

function bgrep {
  rg "$@" $(bundle show --paths) .
}

function bfind {
  find . $(bundle show --paths) -name "*$@*"
}

function open-st {
  open -a "Sublime Text" "$@"
}

function open-md {
  open -a "Marked" "$@"
}

function cwd {
  echo -n `pwd` | pbcopy
}

function furl {
  curl --user fedoraAdmin:fedoraAdmin -k "$@"
}

function fcurl {
  curl --user fedoraAdmin:fedoraAdmin -k "$@"
}

function rubocop-changed {
  git status --porcelain | cut -c4- | grep -v "html.erb$" | grep ".rb" | xargs bundle exec rubocop
}

function rubocop-fix-changed {
  git diff --name-only HEAD~1 | grep -v "html.erb$" | grep ".rb" | xargs bundle exec rubocop -a
}

function rspec-changed {
  git status | grep "_spec.rb" | awk '{ print $2 }' | xargs bundle exec rspec
}

function rspec-save-results {
  cp tmp/rspec_results.html tmp/rspec_results_saved.html
}

function d-rspec {
  if [[ -z "${RSPEC_SERVICE}" ]]; then
    echo "No dc service defined, running rspec locally"
    bundle exec rspec "$@"
  else
    echo "Running rspec with docker"
    docker run --rm -v $(pwd):/app -it ${RSPEC_SERVICE} bundle exec rspec "$@"
  fi
}

function pdf-concat {
  "/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py" -o "$@"
}

# Switch to MariaDB
function maria-switch {
  brew unlink mysql
  brew unlink mariadb && brew link mariadb
  source $HOME/.dotfiles/mariadb/setup.sh
}

# Switch to MySQL
# Download mysql because it is not in the brewfile.
# You can't have both maria and mysql installed and linked. One must be linked with the other unlinked.
function mysql-switch {
  brew unlink mariadb
  brew install mysql
  brew unlink mysql && brew link mysql
  source $HOME/.dotfiles/mysql/setup.sh
}

# Reset Postgres
# Completely removes postgres and reinstalls it to a default configuration
function reset-postgres {
  source $HOME/.dotfiles/postgres/setup.sh
}

# Kill all processes based on a grep
# Works far more effectively than plain, old killall
function massacre {
  ps -ax | grep "$@" | awk '{print $1}' | xargs kill -s KILL
}

# Setup a new Rails project with my own defaults
function rails-new {
  rails new "$@" -m $HOME/.dotfiles/rails/template.rb -T -d postgresql
}

function clean-jetties {
  rm -Rf tmp/solr-development* \
         tmp/solr-test* \
         tmp/fcrepo4-test-data \
         tmp/fcrepo4-development-data \
         tmp/blacklight-core \
         tmp/hydra-dev \
         tmp/blacklight-core-test \
         tmp/hydra-test
}

# Start a new tmux session with a given repo from the Projects directory
function tnr() {
  REPO=`tree -f -d -L 2 -in --noreport $HOME/Projects/Github | rg -i -e "$1" | head -n 1`
  if [ -z $REPO ]; then
    echo "Could not find $1"
  else
    TERM=screen-256color-bce tmux new -s $1 -c ${REPO}
  fi
}

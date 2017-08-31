# Functions

function bgrep {
  ag "$@" $(bundle show --paths) .
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

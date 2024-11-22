# Functions

function bgrep {
  rg "$@" $(bundle show --paths) .
}

function bfind {
  find . $(bundle show --paths) -name "*$@*"
}

function open-md {
  open -a "Marked" "$@"
}

function cwd {
  echo -n `pwd` | pbcopy
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

# Kill all processes based on a grep
# Works far more effectively than plain, old killall
function massacre {
  ps -ax | grep "$@" | awk '{print $1}' | xargs kill -s KILL
}

# Setup a new Rails project with my own defaults
function rails-new {
  rails new "$@" -m $HOME/.dotfiles/rails/template.rb -T -d postgresql
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

function noid() {
  uuidgen | tr '[:upper:]' '[:lower:]' | awk -F\- '{ print $5 }'
}

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

# Kill all processes based on a grep
# Works far more effectively than plain, old killall
function massacre {
  ps -ax | grep "$@" | awk '{print $1}' | xargs kill -s KILL
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

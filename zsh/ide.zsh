function d-rspec {
  if [[ -z "${RSPEC_SERVICE}" ]]; then
    echo "No dc service defined, running rspec locally"
    bundle exec rspec "$@"
  else
    echo "Running rspec with docker"
    docker run --rm -v $(pwd):/app -it ${RSPEC_SERVICE} bundle exec rspec "$@"
  fi
}

# Setup a new Rails project with my own defaults
function rails-new {
  rails new "$@" -m $HOME/.dotfiles/rails/template.rb -T -d postgresql
}

# k-rspec is k8s but for now is just docker
function k-rspec() {
  if [[ -z "${RSPEC_CONTAINER}" ]]; then
    echo "You need a RSPEC_CONTAINER defined, 'cause docker ain't happenin' here..."
  else
    docker run --rm -v $(pwd):/app -it ${RSPEC_CONTAINER} bundle exec rspec $1
  fi
}

function code-backup() {
  cp $HOME/Library/Application\ Support/Code/User/settings.json $HOME/.dotfiles/vscode/settings.json
}

function code-restore() {
  cp $HOME/.dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
}

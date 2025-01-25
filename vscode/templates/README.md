# VSCode Templates

## Install

``` bash
export VSCODE_TEMPLATE="template-name"
mkdir .devcontainer
cp $HOME/.dotfiles/vscode/templates/$VSCODE_TEMPLATE/devcontainer/devcontainer.json .devcontainer/devcontainer.json
mkdir .vscode
cp $HOME/.dotfiles/vscode/templates/$VSCODE_TEMPLATE/vscode/settings.json .vscode/settings.json
```

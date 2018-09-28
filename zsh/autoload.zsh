autoload -U add-zsh-hook
load-local-conf() {
     # check file exists, is regular file and is readable:
     if [[ -f .local_zshrc && -r .local_zshrc ]]; then
       source .local_zshrc
     fi
}
add-zsh-hook chpwd load-local-conf

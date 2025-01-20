# Installs tmux themes

rm -rf $HOME/.tmux-themepack
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.tmux-themepack
mkdir -p $HOME/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


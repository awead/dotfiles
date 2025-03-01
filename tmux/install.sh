# Installs tmux themes and plugins

rm -rf $HOME/.tmux-themepack
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.tmux-themepack
rm -rf $HOME/.tmux/plugins
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
git clone https://github.com/omerxx/tmux-sessionx.git $HOME/.tmux/plugins/tmux-sessionx


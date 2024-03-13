#!bin/bash

ln -sf .config/zsh/config.zsh ~/.zshrc
ln -sf .tmux.conf ~/.tmux.conf
ln -sf .gitconfig ~/.gitconfig

[ ! -d "~/.config" ] && mkdir ~/.config
ln -sf .config/nvim ~/.config/nvim
ln -sf .config/alacritty ~/.config/alacritty

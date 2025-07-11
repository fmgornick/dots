#!/bin/sh

rm  -rf  ~/.zshrc
rm  -rf  ~/.clang-format
rm  -rf  ~/.config/alacritty
rm  -rf  ~/.config/emacs
rm  -rf  ~/.config/git
rm  -rf  ~/.config/nvim
rm  -rf  ~/.config/tmux
rm  -rf  ~/.config/zsh

ln  -sf  ~/.config/zsh/config.zsh        ~/.zshrc
ln  -sf  $(pwd)/clang-format/config.yml  ~/.clang-format
ln  -s   $(pwd)/alacritty-darwin         ~/.config/alacritty
ln  -s   $(pwd)/emacs                    ~/.config/emacs
ln  -s   $(pwd)/git                      ~/.config/git
ln  -s   $(pwd)/nvim                     ~/.config/nvim
ln  -s   $(pwd)/tmux                     ~/.config/tmux
ln  -s   $(pwd)/zsh                      ~/.config/zsh

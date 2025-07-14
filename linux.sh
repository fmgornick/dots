#!/bin/sh

rm  -rf  ~/.bashrc
rm  -rf  ~/.bash_profile
rm  -rf  ~/.clang-format
rm  -rf  ~/.config/alacritty
rm  -rf  ~/.config/bash
rm  -rf  ~/.config/fuzzel
rm  -rf  ~/.config/git
rm  -rf  ~/.config/nvim
rm  -rf  ~/.config/sway
rm  -rf  ~/.config/zathura

ln  -sf  ~/.config/bash/config.bash      ~/.bashrc
ln  -sf  ~/.config/bash/profile.bash     ~/.bash_profile
ln  -sf  $(pwd)/clang-format/config.yml  ~/.clang-format
ln  -s   $(pwd)/alacritty-linux          ~/.config/alacritty
ln  -s   $(pwd)/bash                     ~/.config/bash
ln  -s   $(pwd)/fuzzel                   ~/.config/fuzzel
ln  -s   $(pwd)/git                      ~/.config/git
ln  -s   $(pwd)/nvim                     ~/.config/nvim
ln  -s   $(pwd)/sway                     ~/.config/sway
ln  -s   $(pwd)/zathura                  ~/.config/zathura

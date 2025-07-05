# load bashrc (needed for ssh)
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# default gui settings for xwayland apps
export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=Adwaita-Dark

# user logging in manually => then start sway 
# user logging in via ssh  => fastfetch
[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu || fastfetch


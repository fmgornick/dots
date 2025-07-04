# default gui settings for xwayland apps
export GTK_THEME=Adwaita:dark

# start sway if not already running
[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu

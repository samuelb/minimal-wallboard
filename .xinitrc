# don't turn off display
xset dpms 0 0 0
xset -dpms
xset s noblank
xset s off

# simple fullscreen wm
matchbox-window-manager -use_cursor no -use_titlebar no &

#start VNC client
exec echo "SecurePassword!1" | xtightvncviewer -viewonly -fullscreen -autopass 192.168.1.10:0

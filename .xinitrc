# don't turn off display
xset dpms 0 0 0
xset -dpms
xset s noblank
xset s off

# simple fullscreen wm
matchbox-window-manager -use_cursor no -use_titlebar no &

# start browser
#exec midori -e Fullscreen -e ZoomIn -a "http://example.com/"
exec midori -e Fullscreen -e ZoomIn -a "file:///home/pi/dashboard.html"

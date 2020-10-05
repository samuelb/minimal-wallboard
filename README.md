# minimal-wallboard

This is my prefered configuring of a RaspberryPi to show me some dashboards on
TVs which are hanging in my office or to build a simple kiosk installation.

I didn't verify yet what I wrote here. It might not work.

## Install

Lets assume you have Raspbian installed on your RaspberryPi and you're
connected via SSH.

Ensure that some needed packages are installed:
```
$ sudo apt-get update && sudo apt-get install xinit xserver-xorg-legacy x11-xserver-utils \
  xserver-xorg-video-fbturbo xfonts-scalable xfonts-100dpi xfonts-75dpi xfonts-base \
  midori matchbox-window-manager
```

In `/etc/X11/Xwrapper.config` (create if not exist), put
```
allowed_users=anybody
```

Copy the `.xinitrc`, `dashboard.html` and `bg.gif` to your home `/home/pi/`

Disable all other display manager, eg.
```
$ sudo systemctl disable lightdm
```

Copy the `xinit-login.service` to `/etc/systemd/system/xinit-login.service`

Enable and start the new service
```
$ sudo systemctl daemon-reload
$ sudo systemctl enable xinit-login
$ sudo systemctl start xinit-login
```

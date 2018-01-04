# minimal-wallboard

This is my prefered of configuring a RaspberryPi to show my some dashboards on
TVs which are hanging in my office or or build a simple kiosk installation.

I didn't verify yet what I wrote here. It might not work.

## Install

Lets assume you have Raspbian installed on your RaspberryPi and you're
connected via SSH.

Ensure that some needed packages are installed:
```
$ sudo apt-get install xinit xserver-xorg-legacy x11-xserver-utils \
  xserver-xorg-fbturbo xfonts-scalable xfonts-100dpi xfonts-75dpi xfonts-base \
  midori  
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

# VNC screen

## Install

Lets assume you have Raspbian installed on your RaspberryPi and you're
connected via SSH.

Ensure that some needed packages are installed:
```
$ sudo apt-get install xinit xserver-xorg-legacy x11-xserver-utils \
  xfonts-scalable xfonts-100dpi xfonts-75dpi xfonts-base \
  matchbox-window-manager xtightvncviewer vim
```

In `/etc/X11/Xwrapper.config` (create if not exist), put
```
allowed_users=anybody
```

In `.xinitrc` change the password ("SecurePassword!1") and the ip (192.168.1.10) or hostname to your VNC server configuration
```
#start VNC client
exec echo "SecurePassword!1" | xtightvncviewer -viewonly -fullscreen -autopass 192.168.1.10:0
```

Copy the `.xinitrc` to your home `/home/pi/`


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

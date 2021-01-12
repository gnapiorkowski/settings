#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
# run "dex $HOME/.config/autostart/arcolinux-welcome-app.desktop"
#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
run "nm-applet"
run "pamac-tray"
run "xfsettingsd"
run "thunar --daemon"
run "xfce4-power-manager"
run "blueberry-tray"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "numlockx on"
run "pa-applet"
run "conky -c $HOME/.config/awesome/system-overview"
run "picom --experimental-backends"
# run "setxkbmap -option caps:swapescape"
run "kdeconnect-indicator"
run "syncthing-gtk -m"

#you can set wallpapers in themes as well
# feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &

#run applications from startup
run "signal-desktop"
run "spotifywm"
# run "instaBot"

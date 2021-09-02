#!/usr/bin/env bash
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Start Xorg server at this DPI
#xrandr --dpi 160
# Merge & load configuration from .Xresources
xrdb -merge ~/.Xresources
xrdb -merge ~/.Xdefaults
# Let QT and GTK autodetect retina screen and autoadjust
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export GDK_SCALE=1.5
#export GDK_DPI_SCALE=1.5


run volumeicon
run nm-applet
run redshift-gtk

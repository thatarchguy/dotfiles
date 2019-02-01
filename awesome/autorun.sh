#!/usr/bin/env bash
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
run volumeicon
run nm-applet
run redshift-gtk

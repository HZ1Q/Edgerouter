#!/bin/bash
configure
set system package repository tailscale url '[signed-by=/usr/share/keyrings/tailscale-stretch-stable.gpg] https://pkgs.tailscale.com/stable/debian'
set system package repository tailscale distribution stretch
set system package repository tailscale components main
commit comment "Add Tailscale repository"
save; exit
sudo bash
mkdir -p /config/scripts/firstboot.d
curl -o /config/scripts/firstboot.d/tailscale.sh https://raw.githubusercontent.com/jamesog/tailscale-edgeos/main/firstboot.d/tailscale.sh
chmod 755 /config/scripts/firstboot.d/tailscale.sh
/config/scripts/firstboot.d/tailscale.sh
/config/scripts/post-config.d/tailscale.sh\
clear console
tailscale up

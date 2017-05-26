#!/bin/bash

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Configure user nobody to match unRAID's settings
#usermod -u 99 nobody
#usermod -g 100 nobody
#usermod -d /home nobody
#chown -R nobody:users /home

# Disable SSH
rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

mkdir -p /var/run/dbus

#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################

# Repositories
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"

apt-get update
apt-get install -qy git make gcc g++
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -qy nodejs
apt-get install -qy avahi-daemon mc avahi-discover libnss-mdns libavahi-compat-libdnssd-dev

##################################################
# Install homebridge                             #
##################################################

npm install -g homebridge
npm upgrade -g homebridge
npm install -g dominicstelljes/homebridge-sonos
npm install -g homebridge-smartthings
npm install -g homebridge-lifx-lan



#########################################
##                 CLEANUP             ##
#########################################

# Clean APT install files
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*

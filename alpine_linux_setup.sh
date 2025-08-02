#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

echo "[SETUP] Starting Alpine Linux Setup"

echo "[SETUP] Updating and upgrading system packages..."
apk update
apk upgrade

echo "[SETUP] Installing Docker"
# install docker
apk add docker docker-cli

echo "[SETUP] Starting Docker daemon..."
# start docker daemon
# On Alpine, `service` is a wrapper, we can also call `/etc/init.d/docker directly`
# sudo service docker start
/etc/init.d/docker start

echo "[SETUP] Configuring Docker to start on boot..."
# enable docker to start on boot
# create a symbolic link from the Docker service script 
# in /etc/init.d/docker to the boot runlevel directory.- 
# 
# FYI - `rc-update` - is OpenRC; the init system used by Alpine Linux.
#	
#	/etc/runlevels/boot/docker -> /etc/init.d/docker
sudo rc-update add docker boot

# theres no more docker shenanigans after this line

echo "[SETUP] Installing Neovim depeendecies..."
# install my neovim config dependecies
apk add clang ripgrep luarocks unzip gzip

echo "[SETUP] Installing Neovim..."
# install neovim
apk add neovim


echo "[SETUP] Restart your SSH/terminal session now. (To avoid Docker permission errors)"
echo "[SETUP] Mission complete."


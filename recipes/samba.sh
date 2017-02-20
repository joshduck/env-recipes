#!/bin/bash
set -e

sudo hostname devbox
sudo apt-get install samba -y
sudo update-rc.d smbd defaults

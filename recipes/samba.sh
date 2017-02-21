#!/bin/bash
set -e -v

hostname devbox
apt-get install samba -y
update-rc.d smbd defaults

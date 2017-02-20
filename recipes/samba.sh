#!/bin/bash
set -e

hostname devbox
apt-get install samba -y
update-rc.d smbd defaults

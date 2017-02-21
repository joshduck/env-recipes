#!/bin/bash
set -e -v

apt-get install curl  -y
apt-get purge nodejs npm -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
apt-get install nodejs -y

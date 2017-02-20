#!/bin/bash
set -e

abort()
{
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0

sudo apt-get update
sudo apt-get install tmux curl git -y

/bin/bash recipes/dotfiles.sh
/bin/bash recipes/samba.sh
/bin/bash recipes/postgres.sh
/bin/bash recipes/watchman.sh
/bin/bash recipes/node.sh

trap : 0

echo >&2 '
************
*** DONE ***
************
'

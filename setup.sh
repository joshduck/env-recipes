#!/bin/bash
set -e

abort()
{
    echo >&2 '
!!!!!!!!!!!!!!!
!!! ABORTED !!!
!!!!!!!!!!!!!!!
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0

if [ "$EUID" -ne 0 ]
then
  echo "Please run as root"
  exit 1
fi

$RECIPES = "$(dirname $0)/recipes"

/bin/bash $RECIPES/dotfiles.sh
/bin/bash $RECIPES/samba.sh
/bin/bash $RECIPES/postgres.sh
/bin/bash $RECIPES/watchman.sh
/bin/bash $RECIPES/node.sh

trap : 0

echo >&2 '
************
***  OK  ***
************
'

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

if [ "$EUID" -ne 0 ]
then
  echo "Please run as root"
  exit 1
fi

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

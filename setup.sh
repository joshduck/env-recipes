#!/bin/bash
set -e

abort()
{
    echo >&2 '
!!!!!!!!!!!!!!!!!!!!!
       ABORTED
!!!!!!!!!!!!!!!!!!!!!
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

RECIPES="$(dirname $0)/recipes"

for STEP in dotfiles samba postgres watchman node
do
  echo >&2 "

*********************
 Running: $STEP
*********************
"
  /bin/bash $RECIPES/$STEP.sh
done

trap : 0

echo >&2 '
*********************
         OK
*********************
'

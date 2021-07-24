#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

URI=$1

if [[ $URI =~ ^https://zoom.us/j/ ]]; then
  ZOOM=$(xdg-mime query default x-scheme-handler/zoommtg)
  if [[ -n $ZOOM ]]; then
    NEW=$(echo $URI | sed -E 's@https://zoom.us/j/@zoommtg://zoom.us/join?confno=@; s@\?pwd=@\&pwd=@')
    gtk-launch $ZOOM $NEW
    exit 0;
  fi
fi

if [[ $URI =~ ^https://teams.microsoft.com/l/ ]]; then
  MSTEAMS=$(xdg-mime query default x-scheme-handler/msteams)
  if [[ -n $MSTEAMS ]]; then
    NEW=$(echo $URI | sed -E 's@https://teams.microsoft.com/l/@msteams:/l/@')
    # somehow gtk-launch doesn’t pass the URI properly, have to start teams directly
    teams $NEW
    exit 0;
  fi
fi

BROWSER=$(xdg-mime query default x-scheme-handler/http)
gtk-launch $BROWSER $URI

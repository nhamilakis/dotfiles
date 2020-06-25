#!/usr/bin/env bash

export_vars () {
  if [[  -f "$1" ]]
  then
    export $(cat "$1" | sed 's/#.*//g'| xargs)
  fi

  eval TMP="$TMP"
  eval DOTFILES="$DOTFILES"
}


echo "Deleting Miniconda installation"
# rm -rf $location


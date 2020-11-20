#!/usr/bin/env bash

SCRIPT_NAME=$(readlink -f ${BASH_SOURCE[0]})
DOTFILES="$(dirname "${SCRIPT_NAME}")"

export_vars () {
  if [[  -f "$1" ]];  then
    set -a      # turn on automatic export
    source "$1" # execute all commands in the file
    set +a      # turn off automatic export
  else
      echo "error file $1 was not found !!!"
  fi
}

fetch () {
  URL=$1
  FILENAME=$2

  if [[ ! -f "${TMP}/$FILENAME" ]]; then
    wget "${URL}" -O "${TMP}/${FILENAME}"
  fi
  echo "${TMP}/${FILENAME}"
}

export_vars "${DOTFILES}/global.ini"

eval DOTFILES="$DOTFILES"
eval CONFIG_HOME="$CONFIG_HOME"

# TMP Folder
TMP=$(mktemp -d)
trap 'rm -rf $TMP' EXIT

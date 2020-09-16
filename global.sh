#!/usr/bin/env bash

SCRIPT_NAME=$(readlink -f ${BASH_SOURCE[0]})
DOTFILES="$(dirname "${SCRIPT_NAME}")"


# GNU PATH
PATH="/opt/local/libexec/gnubin:${PATH}"

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
    echo "fetching from ${URL} -> $TMP/install_nvm.sh"
    wget -O "${TMP}/install_nvm.sh" "${URL}"
  fi

  "${TMP}/${FILENAME}"
}

export_vars "${DOTFILES}/global.ini"

eval TMP="$TMP"
eval DOTFILES="$DOTFILES"
eval CONFIG_HOME="$CONFIG_HOME"

mkdir -p "${TMP}"
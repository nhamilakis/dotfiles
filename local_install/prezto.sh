#!/bin/bash
PREZTO_URL=https://github.com/sorin-ionescu/prezto.git

prezto () {
  if  [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
    echo "downloading prezto ..."
    git clone --recursive "${PREZTO_URL}"  "${ZDOTDIR:-$HOME}/.zprezto"
  else
    echo "prezto already exists."
    exit 0
  fi
}


prezto
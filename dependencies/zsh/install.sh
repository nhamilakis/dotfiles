#!/usr/bin/env bash

source ../../global.sh

exists () {
  # check if a command exists
  which "$1" >/dev/null;
}

install () {
  if ! exists "zsh"; then
      echo "installing zsh..."
      apt install -y zsh
  fi
}

prezto () {
  if  [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
    echo "downloading prezto ..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  fi
}

# main
export_vars "zsh.ini"
install
prezto

# Set default
chsh -s /bin/zsh
echo "ZSH: OK"
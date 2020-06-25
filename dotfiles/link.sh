#!/usr/bin/env bash
source ../global.sh


link_item () {
  SOURCE=$1
  TARGET=$2
  # echo "ln -sf ${SOURCE} ${TARGET}"
  ln -sf "${SOURCE}" "${TARGET}"
}

link_config () {
  mkdir -p "${CONFIG_HOME}/.config"
  for item in config/*; do
    item="$(basename "${item}")"
    link_item "${DOTFILES}/dotfiles/config/${item}" "${CONFIG_HOME}/.config/${item}"
  done
}

link_local_bin () {
  mkdir -p "${CONFIG_HOME}/.local/bin"
  for item in local/bin/*; do
    item="$(basename "${item}")"
    link_item "${DOTFILES}/dotfiles/local/bin/${item}" "${CONFIG_HOME}/.local/bin/${item}"
  done
}

link_local_share () {
  mkdir -p "${CONFIG_HOME}/.local/share"
  for item in local/share/*; do
    item="$(basename "${item}")"
    link_item "${DOTFILES}/dotfiles/local/share/${item}" "${CONFIG_HOME}/.local/share/${item}"
  done
}

link_local_etc () {
  mkdir -p "${CONFIG_HOME}/.local/etc"
  for item in local/etc/*; do
    item="$(basename "${item}")"
    link_item "${DOTFILES}/dotfiles/local/etc/${item}" "${CONFIG_HOME}/.local/etc/${item}"
  done
}

link_home () {
  for item in home/*; do
    item="$(basename "${item}")"
    link_item "${DOTFILES}/dotfiles/home/${item}" "${CONFIG_HOME}/.${item}"
  done
}

# main
link_config
link_local_share
link_local_bin
link_local_etc
link_home

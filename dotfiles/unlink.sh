#!/usr/bin/env bash
source ../global.sh

unlink_item () {
  TARGET=$1
  # [[ -L "${TARGET}" ]] && echo "rm ${TARGET}"
  [[ -L "${TARGET}" ]] && rm "${TARGET}"
}

unlink_config () {
  for item in config/*; do
    item="$(basename "${item}")"
    unlink_item "${CONFIG_HOME}/.config/${item}"
  done
}

unlink_local_bin () {
  for item in local/bin/*; do
    item="$(basename "${item}")"
    unlink_item "${CONFIG_HOME}/.local/bin/${item}"
  done
}

unlink_local_share () {
  for item in local/share/*; do
    item="$(basename "${item}")"
    unlink_item "${CONFIG_HOME}/.local/share/${item}"
  done
}

unlink_local_etc () {
  for item in local/etc/*; do
    item="$(basename "${item}")"
    unlink_item "${CONFIG_HOME}/.local/etc/${item}"
  done
}

unlink_home () {
  for item in home/*; do
    item="$(basename "${item}")"
    unlink_item "${CONFIG_HOME}/.${item}"
  done
}

unlink_ssh () {
  for item in ssh/*; do
    item="$(basename "${item}")"
    unlink_item "${CONFIG_HOME}/.ssh/${item}"
  done
}

# main
unlink_config
unlink_local_bin
unlink_home
unlink_ssh

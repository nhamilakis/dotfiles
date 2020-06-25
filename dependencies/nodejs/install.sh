#!/usr/bin/env bash

source ../../global.sh

export_vars "node.ini"

if [[ ! -f "${TMP}/install_nvm.sh" ]]; then
  echo "fetching from $source -> $TMP/install_nvm.sh"
  wget -O "${TMP}/install_nvm.sh" "${source}"
  chmod +x "${TMP}/install_nvm.sh"
fi

bash "${TMP}/install_nvm.sh"


## rest -> https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04
#!/usr/bin/env bash

source ../../global.sh

if which conda >/dev/null; then
    echo "Miniconda already exists! --> exit"
    exit 0
fi

export_vars "conda.ini"

if [[ ! -f "${TMP}/miniconda_install.sh" ]]; then
  echo "fetching from $source -> $TMP/miniconda_install.sh"
  wget -O "${TMP}/miniconda_install.sh" "${source}"
  chmod +x "${TMP}/miniconda_install.sh"
fi

echo "installing miniconda @ $location"
# install in no-prompt mode --> https://docs.anaconda.com/anaconda/install/silent-mode/
bash "${TMP}/miniconda_install.sh" -b -p "$location"

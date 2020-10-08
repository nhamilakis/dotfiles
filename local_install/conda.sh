#!/bin/bash
source=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
location=~/miniconda
TMP=$(mktemp -d -t install-XXXXX)

if which conda >/dev/null; then
    echo "Miniconda already exists! --> exit"
    exit 0
fi

if [[ ! -f "${TMP}/miniconda_install.sh" ]]; then
  echo "fetching from $source -> $TMP/miniconda_install.sh"
  wget -O "${TMP}/miniconda_install.sh" "${source}"
  chmod +x "${TMP}/miniconda_install.sh"
fi

echo "installing miniconda @ $location"
# install in no-prompt mode --> https://docs.anaconda.com/anaconda/install/silent-mode/
bash "${TMP}/miniconda_install.sh" -b -p "$location"
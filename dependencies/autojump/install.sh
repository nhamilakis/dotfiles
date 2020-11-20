#!/usr/bin/env bash

# ref for installation : https://github.com/gsamokovarov/jump

source ../../global.sh

if which jump >/dev/null; then
    echo "jump already exists! --> exit"
    exit 0
fi

export_vars "autojump.ini"


archive=$(fetch ${URL} ${DEB})

echo "downloaded : ${archive}"

dpkg -i ${archive}


#!/usr/bin/env bash

source ../../global.sh

if which docker >/dev/null; then
    echo "Miniconda already exists! --> exit"
    exit 0
fi

export_vars "docker.ini"


curl -fsSL "${DOCKER_GPG}" | apt-key add -

add-apt-repository "deb [arch=amd64] ${DOCKER_APT} $(lsb_release -cs) stable"


apt update

apt install -y docker-ce docker-ce-cli containerd.io

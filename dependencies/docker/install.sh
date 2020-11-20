#!/usr/bin/env bash

source ../../global.sh

if which docker >/dev/null; then
    echo "docker already exists! --> exit"
    exit 0
fi

export_vars "docker.ini"


curl -fsSL "${DOCKER_GPG}" | apt-key add -

add-apt-repository "deb [arch=amd64] ${DOCKER_APT} $(lsb_release -cs) stable"


apt update

apt install -y docker-ce docker-ce-cli containerd.io


if [[ "${USER}" == 'root' ]]  && [[ ! -z "${SUDO_USER}" ]]; then
    echo "adding user ${SUDO_USER} to docker group"
    usermod -a -G docker ${SUDO_USER}
fi
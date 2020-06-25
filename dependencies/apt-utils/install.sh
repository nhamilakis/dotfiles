#!/usr/bin/env bash

source ../../global.sh
export_vars "utils.ini"

apt update
# install modules
while read mod; do
  apt install -y "$mod"
done < utils.list
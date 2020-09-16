#!/usr/bin/env bash

source ../../global.sh
export_vars "utils.ini"

port selfupdate
# install modules
while read mod; do
  port install -y "$mod"
done < utils.list
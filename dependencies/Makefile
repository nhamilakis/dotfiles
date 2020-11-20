SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
APPS=zsh miniconda docker

all: setup $(APPS)

setup: apt-utils
	cd $< && ./install.sh

$(APPS):
	@echo "installing $@ ..."
	cd $@ && ./install.sh

.PHONY: all setup $(APPS)
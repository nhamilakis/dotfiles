SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
APPS=zsh miniconda

all: setup $(APPS)

setup: apt-utils
	cd $< && ./install.sh >> /dev/null 2>&1

$(APPS):
	@echo "installing $@ ..."
	cd $@ && ./install.sh >> /dev/null 2>&1

.PHONY: all setup $(APPS)
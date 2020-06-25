all: dot dependencies

dependencies:
	$(MAKE) -C dependencies

dot:
	cd dotfiles && bash link.sh

undot:
	cd dotfiles && bash unlink.sh

misc:
	$(MAKE) -C misc


.PHONY: dependencies setup clean dot undot misc
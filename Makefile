APT_DEPENDENCIES=$(shell cat apt-dependencies.txt)
LOCAL_DEPS=$(shell find local_install -type f -name "*.sh")
DOTFILE_LOCATION=$(shell pwd)
CONFIG_HOME=${HOME}

info:
	@echo "config_home: ${CONFIG_HOME}"
	@echo "dotfile_location: ${DOTFILE_LOCATION}"
	@echo "local_dependencies: ${LOCAL_DEPS}"
	@echo "apt_dependencies: ${APT_DEPENDENCIES}"


dependencies:
	apt install ${APT_DEPENDENCIES}

local:
	@echo "installing local deps..."
	@for item in ${LOCAL_DEPS}; do \
        bash $$item; \
    done


dot:
	cd dotfiles && bash link.sh ${DOTFILE_LOCATION} ${CONFIG_HOME}

undot:
	cd dotfiles && bash unlink.sh ${CONFIG_HOME}


.PHONY: info dependencies local dot undot
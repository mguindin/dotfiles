.PHONY : link unlink install asdf alpine install_programs
SHELL=/bin/bash

all:
	@echo "make install           - Install everything from this repo, link all configurations, and install asdf"
	@echo "make install_programs  - Install programs through brew (macOS), apt-get (Ubuntu), or apk (alpine)"
	@echo "make asdf              - Install asdf (really good language version management)"
	@echo "make link              - Stow all configurations"
	@echo "make unlink            - Install everything from this repo"
	@echo "make alpine            - Build docker container with all of this based on Alpine Linux"

install: install_programs asdf link

install_programs:
	./install.sh; git submodule update --init

asdf:
	if ! type "asdf" &> /dev/null; then \
		echo "installing asdf"; \
		git clone https://github.com/asdf-vm/asdf.git ~/.asdf; \
	else \
		echo "asdf installed; continuing..."; \
	fi

link:
	for d in */; do \
		stow --target=${HOME} $$d ; \
	done

unlink:
	for d in */; do \
		stow -D $$d ; \
	done

alpine:
	docker build -t mguindin/dev -f Dockerfile.alpine .


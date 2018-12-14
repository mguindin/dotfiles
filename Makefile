.DEFAULT_GOAL := all
.PHONY : link unlink install fish

all: install fish link

install:
	git submodule update --init; ./install.sh

link:
	for d in */; do \
		stow $$d ; \
	done

unlink:
	for d in */; do \
		stow -D $$d ; \
	done

fish:
	if ! type "fish" &> /dev/null; then \
		echo "installing fish"; \
		curl -L https://get.oh-my.fish | fish; \
	else \
		echo "fish already installed; continuing"; \
	fi

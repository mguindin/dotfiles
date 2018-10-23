.DEFAULT_GOAL := all
.PHONY : link unlink install fish

all: install fish link

install:
	git submodule update --init;\
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; \
	brew tap Homebrew/bundle; \
	brew bundle

link:
	for d in */; do \
		stow $$d ; \
	done

unlink:
	for d in */; do \
		stow -D $$d ; \
	done

fish:
	curl -L https://get.oh-my.fish | fish

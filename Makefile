.DEFAULT_GOAL := all
.PHONY : link unlink install fish

all: install asdf link

install:
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
		stow $$d ; \
	done

unlink:
	for d in */; do \
		stow -D $$d ; \
	done


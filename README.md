# Grand Unified Dotfiles

Uses stow and powerline fonts.

For fish, install [fish-shell](http://fishshell.com/)

# Installation
# Makefile (automatic)
The Makefile in this repo will install and configure everything automatically

```sh
make
```

## Manual
On the other hand, if you want to do the installation manually:

## Submodule

```sh
git submodule update --init
```

## Homebrew (brew) (on macOS)

Install [brew](https://brew.sh/) and then install bundle
```sh
brew tap Homebrew/bundle
```

Then install from the Brewfile:
```sh
brew bundle
```

## Stow
All of my dotfiles are in a format that can be symlinked to the correct place
using [stow](https://www.gnu.org/software/stow/)
For example (assuming you clone this repo into your home directory):

```sh
stow vim
stow nvim
stow fish
...
```

This will create symlinks to the correct locations (e.g.: ~/.vimrc,
~/.config/...)

This can also be accomplished with the Makefile:
```sh
make link
```

## Docker
I've also included Dockerfiles for build this repo into a usable developer
container (for both ubuntu and alpine)

### Developer Image (alpine)

```sh
docker build -t mguindin/dev -f Dockerfile.alpine .
```

### Developer Image (ubuntu)
```sh
docker build -t mguindin/ubuntu -f Dockerfile .
```

## Fonts
I like [Fira Code](https://github.com/tonsky/FiraCode) and you'll see it
referenced in a few dotfiles (ligatures are pretty great).

## Python
Install pyenv
```sh
brew install pyenv
```

Install requirements
```sh
pip install -r ./requirements.txt
```

## Vim / Neovim

I prefer neovim, but the configurations for vim here also work in Vim8

# Uninstall
You just need to unlink the stowed filed, using `stow -D` or the Makefile:
```sh
make unlink
```

## Colors

If using alacritty + tmux + fish, then just change the color in fish:
```sh
~/.config/fish/config.fish
```
and vim at
```sh
~/.vim/general.vim
```

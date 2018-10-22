# Grand Unified Dotfiles


Uses stow and powerline fonts.

For fish, install [fish-shell](http://fishshell.com/) and
[oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)


# Installation
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
For example:

```sh
stow vim
stow nvim
stow omf
...
```

## Docker
I've also included Dockerfiles for build this repo into a usable developer
container (for both ubuntu and alpine)

### Developer

```sh
docker build -t mguindin/dev -f Dockerfile.alpine .
```

### Jumpbox
This is a dockerfile for a bastion or jumpbox

```sh
docker build -t mguindin/jump -f Dockerfile.jump .
```

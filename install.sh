#!/bin/sh

set -x

unameOut="$(uname -s)";
case "${unameOut}" in
    Linux*)
      echo "linux"
      # Should be debian-based
      if command -v apk; then \
        # This is alpine
        echo "alpine installing with apk..."
        apk update && apk add --no-cache make vim fish tmux mosh curl\
          git stow python3 musl-dev gnupg\
          curl git stow python3-dev python3 automake autoconf openssh gcc neovim\
          linux-headers bash
      else
        echo "ubuntu installing with apt-get..."
        apt-get update && apt-get -qq install \
          stow fish git automake autoconf libreadline-dev \
          libncurses-dev libssl-dev libyaml-dev \
          libxslt-dev libffi-dev libtool unixodbc-dev \
          make vim tmux mosh curl musl-dev gnupg\
          curl python3-dev python3 automake autoconf ssh gcc neovim
      fi
      ;;
    Darwin*)\
      echo "macOS, brewing"
      # Install homebrew
      if ! command -v brew; then \
        echo "brew not installed; installing..."
        curl -L https://get.oh-my.fish | fish; \
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        # Tap non-default brew taps
        brew tap Homebrew/bundle

        # Install from brew
        brew bundle

        # Install fzf plugins
        $(brew --prefix)/opt/fzf/install
      else
        echo "brew installed; continuing"
      fi
      ;;
esac


#!/bin/sh

set -x

unameOut="$(uname -s)";
case "${unameOut}" in
    Linux*)
      echo "linux, nothing to do here"
      # Should be debian-based
      sudo apt-get update && sudo apt-get install stow \
        fish git automake autoconf libreadline-dev \
        libncurses-dev libssl-dev libyaml-dev \
        libxslt-dev libffi-dev libtool unixodbc-dev
      ;;
    Darwin*)\
      echo "macOS, brewing"
      # Install homebrew
      if ! type "brew" &> /dev/null; then \
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


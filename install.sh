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
        sudo apt-get update && apt-get -qq install \
          stow fish git automake autoconf libreadline-dev \
          libncurses-dev libssl-dev libyaml-dev \
          libxslt-dev libffi-dev libtool unixodbc-dev \
          vim tmux mosh curl musl-dev gnupg awscli\
          curl python3-dev python3 automake autoconf ssh gcc neovim
      fi
      ;;
    Darwin*)\
      echo "macOS, brewing"
      # Install homebrew
      if ! command -v brew; then \
        echo "brew not installed; installing..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        $(brew --prefix)/opt/fzf/install
      else
        echo "brew installed; continuing"
      fi

      echo "Installing from Brew Bundle file"
      # Tap non-default brew taps
      brew tap Homebrew/bundle
        # Install from brew
      brew bundle

      echo "Installing fzf plugins"
      $(brew --prefix)/opt/fzf/install

      echo "configuring macOS for better usability"
      echo "Unhiding ~/Library"
      chflags nohidden ~/Library #Show Library
      echo "Setting to show all hidden files in Finder"
      defaults write com.apple.finder AppleShowAllFiles YES #Show Hidden Files
      echo "Show path bar in Finder"
      defaults write com.apple.finder ShowPathbar -bool true #Show Path Bar
      echo "Show status bar in Finder"
      defaults write com.apple.finder ShowStatusBar -bool true #Show status Bar
      ;;
esac


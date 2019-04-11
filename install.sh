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
        apk update && apk add --no-cache\
          make vim fish tmux mosh curl\
          git stow python3 python3-dev musl-dev gnupg\
          automake autoconf openssh gcc neovim\
          linux-headers bash
      elif command -v yum; then \
        # This is RHEL / amazon linux
        echo "red hat/amazon linux installing with yum..."
        # Let's add fish
        sudo yum-config-manager --add-repo https://download.opensuse.org/repositories/shells:/fish:/release:/3/RHEL_7/shells:fish:release:3.repo
        sudo yum update && sudo yum install -yy\
          make vim fish tmux mosh curl\
          git stow gnupg automake autoconf\
          openssh gcc bash ssh
      else
        echo "ubuntu installing with apt-get..."
        sudo apt-get update && apt-get -qq install \
          stow fish git automake autoconf libreadline-dev \
          libncurses-dev libssl-dev libyaml-dev \
          libxslt-dev libffi-dev libtool unixodbc-dev \
          vim tmux mosh curl musl-dev gnupg awscli\
          curl python3-dev python3 ssh gcc neovim
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

      echo "Installing macOS SDK Headers (necessary for building certain tools)"
      sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
      ;;
esac


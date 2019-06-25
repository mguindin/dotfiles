# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Base16 Shell
if status --is-interactive
  base16 onedark
end

switch (uname -a)
  # This is for WSL
  case '*Microsoft*'
    set -xg DOCKER_HOST tcp://127.0.0.1:2375
  # Linux
  case '*Linux*'
    # For ubuntu
    if test -d "/snap/bin"
      set -xg PATH /snap/bin $PATH
    end
  case '*Darwin*'
    set -xg GREP_OPTIONS '--color=auto'
    set -xg GREP_COLOR '3;33'
end

set -xg GOPATH $HOME/go

set -xg LESS '--ignore-case --raw-control-chars'
set -xg PAGER 'less -R'
set -xg EDITOR 'vim'

# Set language to en_US
set -xg LANG en_US.UTF-8
set -xg LC_CTYPE "en_US.UTF-8"
set -xg LC_MESSAGES "en_US.UTF-8"
set -xg LC_COLLATE C

# Set this to not have issues over VPN running spark locally
set -xg SPARK_LOCAL_IP 127.0.0.1

# fzf / rg
set -xg FZF_DEFAULT_COMMAND "rg --files"

# set up PATH
# Add normal binary paths
set -xg PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /bin $PATH

# Add Go binaries, if available
if command -sq go
  set -xg PATH $HOME/go/bin $PATH
end

# Add rust binaries, if available
if test -d "$HOME/.cargo"
  source $HOME/.cargo/env
  set -xg PATH $HOME/.cargo/bin $PATH
end

# If ~/.local/bin is here, add it to PATH
if test -d "$HOME/.local/bin"
  set -xg PATH $HOME/.local/bin $PATH
end


# Add pyenv, if available
if test -d "$HOME/.pyenv"
  set -x PYENV_ROOT $HOME/.pyenv
  set -x PYTHON_CONFIGURE_OPTS "--enable-framework"
  # Set virtualenvs to be located in one place
  set -x WORKON_HOME $HOME/.ve
  # Set virtualenv projects in one place
  set -x PROJECT_HOME $HOME/p
  # Make sure virtualfish knows where venvs are
  set -x VIRTUALFISH_HOME $HOME/.ve
  # Add pyenv root to PATH to access its shims
  set -xg PATH $PYENV_ROOT/bin $PATH
  # load pyenv and virtualenv-init, etc
  status --is-interactive; and pyenv init - | source; and pyenv virtualenv-init - | source
  eval (python -m virtualfish compat_aliases auto_activation)
end

# Add machine-specific stuff if machine.fish is present
if test -d "$HOME/.machine.fish"
  source $HOME/.machine.fish
end

set -xg MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/opt/gnu-sed/libexec/gnuman $MANPATH

# fish status
set -g fish_user
set fish_pager_color_progress cyan

set -g theme_color_scheme terminal2-dark-black
set -g theme_display_k8s_context no
set -g theme_display_user no
set -g theme_display_hostname no
set -g theme_display_cmd_duration yes
set -g theme_display_ruby no
set -g theme_display_virtualenv yes
set -g theme_display_hg no
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_display_user no
set -g theme_date_format "+%a %H:%M:%S"
set -g theme_title_use_abbreviated_path no
set -g theme_nerd_fonts no
set -g theme_show_exit_status yes
set -g theme_newline_cursor no

# Source direnv if available
if test -d ".envrc"; and command -sq direnv
  direnv hook fish | source
end

# asdf (go/scala/python binary manager)
if test -d "$HOME/.asdf"
  source ~/.asdf/asdf.fish
end

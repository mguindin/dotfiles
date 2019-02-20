# Install fish
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
  case '*Microsoft*'
    set -xg DOCKER_HOST tcp://127.0.0.1:2375
  case '*Linux*'
  case '*Darwin*'
    set -xg GREP_OPTIONS '--color=auto'
    set -xg GREP_COLOR '3;33'
    # add pyspark
    set -xg SPARK_HOME /usr/local/Cellar/apache-spark/2.4.0/libexec
end

set -xg GOPATH $HOME/go

set -xg LESS '--ignore-case --raw-control-chars'
set -xg PAGER 'less -R'
set -xg EDITOR 'vim'

set -xg LANG en_US.UTF-8
set -xg LC_CTYPE "en_US.UTF-8"
set -xg LC_MESSAGES "en_US.UTF-8"
set -xg LC_COLLATE C

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

if test -d "$HOME/.local/bin"
  set -xg PATH $HOME/.local/bin $PATH
end

# asdf
if test -d "$HOME/.asdf"
  source ~/.asdf/asdf.fish
end

if test -d "$SPARK_HOME"
  # Set this to not have issues over VPN running spark locally
  set -xg SPARK_LOCAL_IP 127.0.0.1
  set spark_python $SPARK_HOME/python/lib/py4j-0.10.4-src.zip
  set -xg PYTHONPATH $spark_python $SPARK_HOME/python $SPARK_HOME/python/build $PYTHONPATH
end

# Add pyenv, if available
if command -sq pyenv
  set -x PYENV_ROOT $HOME/.pyenv
  set -x PYTHON_CONFIGURE_OPTS "--enable-framework"
  set -xg PATH $PYENV_ROOT/bin $PATH
  status --is-interactive; and source (pyenv init -|psub); and source (pyenv virtualenv-init -|psub)
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
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_display_user no
set -g theme_date_format "+%a %H:%M:%S"
set -g theme_title_use_abbreviated_path no
set -g theme_nerd_fonts no
set -g theme_show_exit_status yes
set -g theme_newline_cursor no

if command -sq kitty
  kitty + complete setup fish | source
end


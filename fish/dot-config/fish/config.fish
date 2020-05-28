set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
# Install fisher
if not functions -q fisher
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# color for less and man
set -xg MANPAGER 'less -s -M +Gg'
set -xg LESS '--ignore-case --raw-control-chars'
set -xg PAGER 'less -R'
set -xg EDITOR 'nvim'

# vi-mode
fish_vi_key_bindings
# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# Set language to en_US
set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8
set -xg LANGUAGE en_US.UTF-8
set -xg LC_CTYPE "en_US.UTF-8"
set -xg LC_MESSAGES "en_US.UTF-8"
set -xg LC_COLLATE C

# Set this to not have issues over VPN running spark locally
set -xg SPARK_LOCAL_IP 127.0.0.1

# fzf / ripgrep
set -xg FZF_DEFAULT_COMMAND "rg --files"

# set up PATH
# Add normal binary paths
set -xg PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /bin $PATH

# Add Go binaries, if available
if command -sq go
  set -xg GOPATH $HOME/go
  set -xg PATH $HOME/go/bin $PATH
end

# Add rust binaries, if available
if test -d "$HOME/.cargo"
  set -xg PATH $HOME/.cargo/bin $PATH
end

# If ~/.local/bin is here, add it to PATH
if test -d "$HOME/.local/bin"
  set -xg PATH $HOME/.local/bin $PATH
end

# If ~/bin is here, add it to PATH
if test -d "$HOME/bin"
  set -xg PATH $HOME/bin $PATH
end

# global abbreviations (faster than -U universal)
if status --is-interactive
  source $XDG_CONFIG_HOME/fish/abbr.fish
end

# fish status and colors
set -g fish_user
set fish_pager_color_progress cyan
set -U fish_color_normal normal
set -U fish_color_command 009999
set -U fish_color_quote 5CCCCC
set -U fish_color_redirection BF7130
set -U fish_color_end FFB273
set -U fish_color_error FF7400
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 006363
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_comment FF9640
set -U fish_color_match --background=brblue
set -U fish_color_param 33CCCC

# Source direnv if available
if command -sq direnv
  direnv hook fish | source
end

# OS-specific settings
switch (uname -a)
# This is for WSL
  case '*Microsoft*'
    set -xg DOCKER_HOST tcp://127.0.0.1:2375
  case '*Linux*'
    set -xg OSTYPE 'Linux'
    set -xg TERMINFO /usr/share/terminfo
  case '*Darwin*'
    set -xg OSTYPE 'Darwin'
    set -xg TERMINFO $HOME/.terminfo
    # Let's use GNU versions of grep, etc instead of macOS's old versions
    set -xg PATH /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/grep/libexec/gnubin $PATH
    set -xg MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/opt/gnu-sed/libexec/gnuman $MANPATH
    set -xg GREP_COLOR '3;33'
    # enable framework only works on macOS
    set -x PYTHON_CONFIGURE_OPTS "--enable-framework"
    # GPG for terminal use
    set -xg GPG_TTY (tty)
  case '*'
    set -xg OSTYPE 'Other'
end

# Add pyenv, if available
if command -sq pyenv
  # set where pyenv is installed
  set -x PYENV_ROOT $HOME/.pyenv
  # Disable prompt as it's been removed
  set -x PYENV_VIRTUALENV_DISABLE_PROMPT 1
  # Set virtualenvs to be located in one place
  set -x WORKON_HOME $HOME/.ve
  # Set virtualenv projects in one place
  set -x PROJECT_HOME $HOME/p
  # Add pyenv root to PATH to access its shims
  set -xg PATH $PYENV_ROOT/bin $PATH
  # load pyenv and virtualenv-init, etc
  status --is-interactive; and pyenv init - | source
end

# asdf (go/scala/ruby/etc binary manager)
if test -d "$HOME/.asdf"
  source ~/.asdf/asdf.fish
end

# Add machine-specific stuff if machine.fish is present
if test -e "$HOME/.machine.fish"
  source $HOME/.machine.fish
end

# source kitty config if we're using kitty terminal
if command -sq kitty
  kitty + complete setup fish | source
end

if command -sq navi
  navi widget fish | source
end

# starship fish prompt
starship init fish | source

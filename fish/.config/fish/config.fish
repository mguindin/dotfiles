# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Base16 Shell
if status --is-interactive; and functions -q base16
  base16 onedark
end

set -xg GOPATH $HOME/go

# color for less and man
set -xg MANPAGER 'less -s -M +Gg'
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

# fzf / ripgrep
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
  set -xg PATH $HOME/.cargo/bin $PATH
end

# If ~/.local/bin is here, add it to PATH
if test -d "$HOME/.local/bin"
  set -xg PATH $HOME/.local/bin $PATH
end

# Add machine-specific stuff if machine.fish is present
if test -d "$HOME/.machine.fish"
  source $HOME/.machine.fish
end

set -xg MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/opt/gnu-sed/libexec/gnuman $MANPATH

# global abbreviations (faster than -U universal)
if status --is-interactive
    abbr --add --global arn 'asdf reshim nodejs'
    abbr --add --global b bat
    abbr --add --global be 'bundle exec'
    abbr --add --global dcb 'docker-compose build'
    abbr --add --global dcd 'docker-compose down -v'
    abbr --add --global dcs 'docker-compose stop'
    abbr --add --global dcu 'docker-compose up --build -d'
    abbr --add --global dps 'docker ps'
    abbr --add --global ds 'docker-compose stop'
    abbr --add --global g git
    abbr --add --global gcm 'git checkout master'
    abbr --add --global gco 'git checkout'
    abbr --add --global gd 'git diff'
    abbr --add --global gp 'git pull'
    abbr --add --global gpm 'git pull origin master'
    abbr --add --global gpull 'git pull'
    abbr --add --global la 'lsd -la'
    abbr --add --global lah 'lsd -lah'
    abbr --add --global ll 'lsd -l'
    abbr --add --global lrt 'lsd -lrt'
    abbr --add --global ls lsd
    abbr --add --global mux tmuxinator
    abbr --add --global nv nvim
    abbr --add --global pa 'pyenv activate'
    abbr --add --global pd 'pyenv deactivate'
    abbr --add --global s 'git status'
    abbr --add --global sf 'source $HOME/.config/fish/config.fish'
    abbr --add --global t tldr
    abbr --add --global ta tn
    abbr --add --global tl 'tmux ls'
    abbr --add --global vfish 'vim $HOME/.config/fish/config.fish'
    abbr --add --global va 'nvim $HOME/.vim/autocommands.vim'
    abbr --add --global vg 'nvim $HOME/.vim/general.vim'
    abbr --add --global vk 'nvim $HOME/.vim/keybindings.vim'
    abbr --add --global vp 'nvim $HOME/.vim/plugins.vim'
    abbr --add --global vs 'nvim -S $HOME/.vim/sessions/session'
    # etcetera
end
# fish status
set -g fish_user
set fish_pager_color_progress cyan

set -g theme_color_scheme terminal2-dark-black
set -g theme_display_k8s_context no
set -g theme_display_user ssh
set -g theme_display_hostname no
set -g theme_display_cmd_duration yes
set -g theme_display_ruby no
set -g theme_display_virtualenv yes
set -g theme_display_hg no
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose no
set -g theme_display_git_dirty_verbose no
set -g theme_display_git_stashed_verbose no
set -g theme_display_git_master_branch no
set -g theme_git_worktree_support no
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_date_format "+%a %H:%M:%S"
set -g theme_title_use_abbreviated_path yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_newline_cursor no
set -g theme_project_dir_length 1
set -g fish_prompt_pwd_dir_length 1

# Source direnv if available
if command -sq direnv
  direnv hook fish | source
end

# OS-specific settings
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
    # Let's use GNU versions of grep, etc instead of macOS's old versions
    set -xg PATH /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/grep/libexec/gnubin $PATH
    set -xg GREP_COLOR '3;33'
end

# Add pyenv, if available
if test -d "$HOME/.pyenv"
  # set where pyenv is installed
  set -x PYENV_ROOT $HOME/.pyenv
  # Disable prompt as it's been removed
  set -x PYENV_VIRTUALENV_DISABLE_PROMPT 1
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
  status --is-interactive; and pyenv init - | source
  eval (python -m virtualfish compat_aliases auto_activation)
end

# asdf (go/scala/ruby/etc binary manager)
if test -d "$HOME/.asdf"
  source ~/.asdf/asdf.fish
end

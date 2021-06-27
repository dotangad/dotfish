set LANG en_US.UTF-8
set TERM xterm-256color

set -x GOPATH $HOME/src/go
set -x GOBIN $HOME/src/go/bin

set -x DOTANGAD_OS ""
switch (uname)
  case Linux
    set -x DOTANGAD_OS "LINUX"
    source $HOME/.config/fish/linux.fish
    set PATH $HOME/.config/composer/vendor/bin $PATH
    set PATH /usr/local/go/bin $PATH
    # https://github.com/baskerville/bspwm/issues/763
    export DISPLAY=:0
  case Darwin
    set -x DOTANGAD_OS "MACOS"
    source $HOME/.config/fish/macos.fish
  case '*'
    set -x DOTANGAD_OS "UNKNOWN"
end

set -x EDITOR "nvim"

fish_add_path /usr/local/bin
fish_add_path $GOBIN
fish_add_path /usr/local/sbin
fish_add_path $HOME/dotfiles/scripts
fish_add_path $HOME/bin
fish_add_path /usr/lib/ruby/gems/3.0.0
fish_add_path $HOME/.local/share/gem/ruby/3.0.0
fish_add_path (dirname (nvm which 16.4.0))

function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
end

# GPG ioctl error
# https://stackoverflow.com/questions/57591432/gpg-signing-failed-inappropriate-ioctl-for-device-on-macos-with-maven
set -x GPG_TTY (tty)

source ~/dotfiles/aliases.sh

# Rust and cargo
if [ -f "$HOME/.cargo/env" ]
  bass source $HOME/.cargo/env
end

function rc
  source ~/.config/fish/config.fish
end

function fish_greeting
  printf "\n\n"
  fortune
  printf "\n\n"
end

alias sail='bash vendor/bin/sail'

# function nvm
#     bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
# end
# nvm use node

# Theme
# source ~/.config/fish/set_colors.fish

# FZF respect .gitignore
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

# Install tide
# curl -sL git.io/tide | source && tide_install

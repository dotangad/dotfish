set LANG en_US.UTF-8
set TERM xterm-256color

set -x GOPATH $HOME/src/go
set -x GOBIN $HOME/src/go/bin

set -x DOTANGAD_OS ""
switch (uname)
  case Linux
    set -x DOTANGAD_OS "LINUX"
    source $HOME/.config/fish/linux.fish
  case Darwin
    set -x DOTANGAD_OS "MACOS"
    source $HOME/.config/fish/macos.fish
  case '*'
    set -x DOTANGAD_OS "UNKNOWN"
end

set EDITOR "nvim"

set PATH /usr/local/bin $PATH
set PATH $GOBIN $PATH
set PATH /usr/local/sbin $PATH
set PATH $HOME/dotfiles/scripts $PATH

function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
end

# GPG ioctl error
# https://stackoverflow.com/questions/57591432/gpg-signing-failed-inappropriate-ioctl-for-device-on-macos-with-maven
set -x GPG_TTY (tty)

source ~/dotfiles/aliases.sh

# Rust and cargo
bass source $HOME/.cargo/env

function rc
  source ~/.config/fish/config.fish
end

function fish_greeting
  printf "\n\n"
  fortune
  printf "\n\n"
end

# Install tide
# curl -sL git.io/tide | source && tide_install

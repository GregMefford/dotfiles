#!/bin/sh

#######################################################
# bootstrap.sh
# Adapted from https://github.com/keathley/dotfiles
#######################################################

set -e

fancy_echo() {
  local fmt="$1"; shift

  printf "\n$fmt\n" "$@"
}

install_latest() {
  if [ ! -d "~/.asdf/installs/$1" ]
  then
    fancy_echo "Installing $1..."
    asdf list-all $1 | tail -1 | xargs asdf install $1
  fi
}

fancy_echo "Setting MacOs defaults..."
source ~/dotfiles/set-defaults.sh

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ ! -d "$HOME/bin" ]; then
  fancy_echo "Creating bin directory..."
  mkdir ~/bin
fi

if [ ! -d "$HOME/go" ]; then
  fancy_echo "Creating go directory..."
  mkdir ~/go
fi

if [ ! -d "$HOME/projects" ]; then
  fancy_echo "Creating projects directory..."
  mkdir -p ~/projects
fi

fancy_echo "Installing Homebrew packages..."
brew update
brew bundle --file=$HOME/dotfiles/Brewfile

fancy_echo "Linking dotfiles..."
rcup -d $HOME/dotfiles/rcfiles

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  fancy_echo "Installing vim plugins..."
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

if ! asdf plugin-list | grep elixir > /dev/null
then
  fancy_echo "Installing elixir asdf plugin..."
  asdf plugin-add elixir
fi

if ! asdf plugin-list | grep erlang > /dev/null
then
    fancy_echo "Installing erlang asdf plugin..."
    asdf plugin-add erlang
fi

if ! asdf plugin-list | grep ruby > /dev/null
then
  fancy_echo "Installing ruby asdf plugin..."
  asdf plugin-add ruby
fi

if ! asdf plugin-list | grep nodejs > /dev/null
then
  fancy_echo "Installing nodejs asdf plugin..."
  asdf plugin-add nodejs
fi

if ! command -v rustup > /dev/null
then
  fancy_echo "Installing rustup..."
  curl https://sh.rustup.rs -sSf | sh
fi

# if [[ ! $(psql -U postgres -c '\du' | grep 'postgres') ]]
# then
#   fancy_echo "Setting up postgres"
#   createuser -s postgres
# fi

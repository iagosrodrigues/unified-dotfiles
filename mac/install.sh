#!/bin/sh

set -xe

# Starting with Catalina, the default shell is now zsh

function install_homebrew() {
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_ohmyzsh() {
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_rust() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	brew install fd
	cargo install rg exa dutree cargo-edit
}

function install_brew_packages() {
  macos_softwares=(exa ripgrep google-chrome docker spotify iterm2 fantastical visual-studio-code)
  brew install ${macos_softwares[@]}
}

install_homebrew
install_ohmyzsh

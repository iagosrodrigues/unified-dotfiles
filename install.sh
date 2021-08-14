#/bin/zsh

# set -xe

install_on_macos() {
  brew_softwares=(
    ansible
    bandwhich
    bingrep
    cmake
    dnscrypt-proxy
    dnsmasq
    dunst
    elixir
    exa
    exercism
    fd
    git
    git-lfs
    gnupg
    htop
    httpie
    hyperfine
    imagemagick
    lua
    miniserve
    neovim
    nmap
    node
    p7zip
    procs
    ripgrep
    sk
    terraform
    tmux
    unrar
    wget
    yarn
    youtube-dl
    ytop
  )

  cargo_softwares=(
    cargo-edit
    cargo-web
    du-dust
    exa
    hx
  )

  echo "Installing Homebrew..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  echo "Installing packages..."
  echo brew install "${brew_softwares[*]}"

  echo "Installing cargo plugins..."
  echo cargo install "${cargo_softwares[*]}"
}

install_links() {
  ln -sf $PWD/tmux/.tmux.conf $HOME
}

case "$OSTYPE" in
  darwin*) install_on_macos ;;
esac

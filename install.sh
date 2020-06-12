#/bin/zsh

# set -xe

install_on_macos() {
  brew_softwares=(
    ansible
    asciinema
    autoconf
    automake
    awscli
    bandwhich
    bingrep
    cmake
    deno
    dnscrypt-proxy
    dnsmasq
    docker-compose
    dunst
    elixir
    emacs
    erlang
    exa
    exercism
    fd
    ghc
    git
    git-lfs
    gnupg
    haskell-stack
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

  echo brew install "${brew_softwares[*]}"
  echo cargo install "${cargo_softwares[*]}"
}

case "$OSTYPE" in
  darwin*) install_on_macos ;;
esac

# ZSH
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
# git clone https://github.com/zdharma/fast-syntax-highlighting.git ~ZSH_CUSTOM/plugins/fast-syntax-highlighting

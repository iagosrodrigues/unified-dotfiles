if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source ~/.aliases

source /usr/local/share/zsh/site-functions/key-bindings.zsh

function break_your_neck() {
    sudo sysctl -w kern.maxfiles=10485760
    sudo sysctl -w kern.maxfilesperproc=1048576
}

alias explode_ios=break_your_neck

alias luamake=/Users/iago/Projects/lua-language-server/3rd/luamake/luamake

gpgconf --launch gpg-agent

export GPG_TTY=$(tty)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

alias backup_gpg="(umask 077 && tar -caf $HOME/gnupg-backup_`date +%Y%m%d_%H%M%S`.tar.xz -C $HOME .gnupg)"

if [[ -d ~/.local/bin ]]; then
  export PATH="$PATH:~/.local/bin"
fi

export HISTSIZE=10000
export HISTFILE=~/.zsh_history

source ~/.aliases

export PATH="$PATH:/home/iago/.cargo/bin"

# source /usr/local/share/zsh/site-functions/key-bindings.zsh

function break_your_neck() {
    sudo sysctl -w kern.maxfiles=10485760
    sudo sysctl -w kern.maxfilesperproc=1048576
}

alias explode_ios=break_your_neck

# Enable selected completion to be highlighted
zstyle ':completion:*:*:*:*:*' menu select

h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi

autoload -Uz compinit && compinit -i

sconnect() {
  ssh "$@"
}

reload() {
  unfunction _sconnect
  autoload -U _sconnect
}

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"

zplug "lukechilds/zsh-nvm"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

eval "$(starship init zsh)"

gpgconf --launch gpg-agent

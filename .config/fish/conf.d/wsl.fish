if set -q WSL_DISTRO_NAME
  set -x SSH_AUTH_SOCK "$HOME/.ssh/agent.sock"
  if not ss -a | grep -q "$SSH_AUTH_SOCK";
    rm -f "$SSH_AUTH_SOCK"
    set wsl2_ssh_pageant_bin "$HOME/.ssh/wsl2-ssh-pageant.exe"
    if test -x "$wsl2_ssh_pageant_bin";
      setsid nohup socat UNIX-LISTEN:"$SSH_AUTH_SOCK,fork" EXEC:"$wsl2_ssh_pageant_bin" >/dev/null 2>&1 &
    else
      echo >&2 "WARNING: $wsl2_ssh_pageant_bin is not executable."
    end
    set --erase wsl2_ssh_pageant_bin
  end

  set -x GPG_AGENT_SOCK "$HOME/.gnupg/S.gpg-agent"
  if not ss -a | grep -q "$GPG_AGENT_SOCK";
    rm -rf "$GPG_AGENT_SOCK"
    set wsl2_ssh_pageant_bin "$HOME/.ssh/wsl2-ssh-pageant.exe"
    set gpg_conf (gpgconf.exe --list-dirs | awk -F: '/socketdir/{print $2}' | string replace -a '\\' '/' | string replace '%3a' '\:' $gpg_conf | string trim)
    #echo "C\:/Users/iagop/AppData/Local/gnupg" > $HOME/teste
    if test -x "$wsl2_ssh_pageant_bin";
      setsid nohup socat UNIX-LISTEN:"$GPG_AGENT_SOCK,fork" EXEC:"$wsl2_ssh_pageant_bin --gpgConfigBasepath $gpg_conf --gpg S.gpg-agent" >/dev/null 2>&1 &
    else
      echo >&2 "WARNING: $wsl2_ssh_pageant_bin is not executable."
    end
    set --erase wsl2_ssh_pageant_bin
    set --erase gpg_conf
  end
end

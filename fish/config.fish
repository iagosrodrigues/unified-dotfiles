if status is-interactive
  mcfly init fish | source
  zoxide init fish | source
    # Commands to run in interactive sessions can go here
end

gpgconf --launch gpg-agent

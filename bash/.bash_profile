function script_if_exists {
    [[ -s $1 ]] && source $1
}

# Shell aliases, prompts, etc.
script_if_exists ~/git-completion.bash
script_if_exists ~/.bash_custom
script_if_exists ~/.ps1

# Keychain
/usr/bin/keychain $HOME/.ssh/id_rsa
script_if_exists $HOME/.keychain/$HOSTNAME-sh

# RVM
script_if_exists "$HOME/.rvm/scripts/rvm"

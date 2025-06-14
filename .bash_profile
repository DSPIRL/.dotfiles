#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
. "/home/athe/.cargo/bin/env"

##### RUST #####
if [[ $(ls -lAFh $HOME | grep ".cargo") ]]; then
    . "$HOME/.cargo/env"
fi

if [ $(uname -s) = "Darwin" ]; then
    export XDG_CONFIG_HOME="/Users/raphi/.config"
fi

##### CUSTOM ENVIRONMENT VARIABLES #####
export USER_TERMINAL=alacritty

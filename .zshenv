##### RUST #####
if [[ $(ls -lAFh $HOME | grep ".cargo") ]]; then
    export XDG_CONFIG_HOME="${HOME}/.config"
    . "$HOME/.cargo/env"
fi

if [ $(uname -s) = "Darwin" ]; then
    export XDG_CONFIG_HOME="/Users/raphi/.config"
fi

##### CUSTOM ENVIRONMENT VARIABLES #####
export USER_TERMINAL=alacritty

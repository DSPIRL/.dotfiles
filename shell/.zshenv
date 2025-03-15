##### RUST #####
if [[ $(ls -lAFh $HOME | grep ".cargo") ]]; then
    . "$HOME/.cargo/env"
fi

if [ $(uname -s) = "Darwin" ]; then
    export XDG_CONFIG_HOME="/Users/raphi/.config"
fi

# export LANG=en_US.UTF-8

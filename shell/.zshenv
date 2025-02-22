##### RUST #####
if [[ $(ls -lAFh $HOME | grep ".cargo") ]]; then
    . "$HOME/.cargo/env"
fi

export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="/Users/raphi/.config"

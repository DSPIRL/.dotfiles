##### ALIASES ON LINE 211, under zsh plugins #####
##### SOURCE #####
# source ~/.dotfiles/shell/completion/flutter_completion.sh


##### EDITOR #####
if [ $(uname -s) = "Darwin" ]; then
    export VISUAL="/opt/homebrew/bin/nvim"
elif [ $(uname -s) = "Linux" ]; then
    export VISUAL="/usr/bin/nvim"
fi


##### MANPAGER #####
export MANPAGER='nvim +Man!'


##### JAVA #####
if [ $(uname -s) = "Darwin" ]; then
    export JAVA_HOME="/Users/raphi/Library/Java/JavaVirtualMachines/azul-16.0.2/Contents/Home"
elif [ $(uname -s) = "Linux" ]; then

fi


##### PATH + VARS #####
if [ $(uname -s) = "Darwin" ]; then
    export PATH="$HOME/.local/bin:$HOME/development/flutter/bin:/opt/homebrew/opt/ruby/bin:$JAVA_HOME/bin:$PATH"
    # export GEM_HOME=$HOME/.gem
elif [ $(uname -s) = "Linux" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi


##### NODE #####
# NVM
if [ $(uname -s) = "Darwin" ]; then
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
elif [[ $(uname -s) = "Linux" ]]; then

fi

##### HOMEBREW #####
if [ $(uname -s) = "Linux" ] && [ $(ls /home/ | grep "linuxbrew") ]; then
    # On linux the below line is required to work properly
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


##### FZF #####
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_CTRL_COMMAND="find . -printf '%P\\n'"


##### ZOXIDE #####
eval "$(zoxide init zsh)"
export _ZO_DATA_DIR="$HOME/.config/zoxide"
export _ZO_ECHO=1


##### STARSHIP #####
eval "$(starship init zsh)"


##### ZSH SETUP #####
if [ $(uname -s) = "Darwin" ]; then
    # MacOS
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # History setup 
    HISTFILE=$HOME/.zhistory
    SAVEHIST=1000
    HISTSIZE=999
    setopt share_history
    setopt hist_expire_dups_first
    setopt hist_ignore_dups
    setopt hist_verify
elif [ $(uname -s) = "Linux" ]; then
    # Linux
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # History setup 
    HISTFILE=$HOME/.zhistory
    SAVEHIST=1000
    HISTSIZE=999
    setopt share_history
    setopt hist_expire_dups_first
    setopt hist_ignore_dups
    setopt hist_verify
fi


##### EZA Autocompletions #####
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi


##### OH-MY-ZSH #####
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
#
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

if [ $(uname -s) = "Darwin" ]; then
    plugins=(
        aliases
        dotnet
        fzf
        git
        kubectl
        pip
        podman
        rust
        zoxide
        flutter
    )
elif [ $(uname -s) = "Linux" ]; then
    plugins=(
        aliases
        archlinux
        dotnet
        fzf
        git
        kubectl
        pip
        podman
        rust
        ssh
        zoxide
    )
fi

source $ZSH/oh-my-zsh.sh


# fixing issue it prepending remnant character when tabbing.
# export LC_ALL="en_US.UTF-8"


##### ALIASES #####
source ~/.dotfiles/shell/.aliases.sh


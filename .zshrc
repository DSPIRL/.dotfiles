hostOS=$(uname -s)
macOS="Darwin"
linux="Linux"


if [[ "$hostOS" == "$macOS" ]]; then
    ##### EDITOR #####
    export VISUAL="/opt/homebrew/bin/nvim"
    export EDITOR="/opt/homebrew/bin/nvim"

    ##### JAVA #####
    export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/openjdk-22.0.2/Contents/Home"

    ##### PATH #####
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$HOME/.local/scripts:$PATH"
    export PATH="$HOME/development/flutter/bin:$PATH"
    export PATH="$HOME/fvm/default/bin:$PATH"
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
    export PATH="$JAVA_HOME/bin:$PATH"
    export GEM_HOME=$HOME/.gem

    ##### DOTNET #####
    if [[ $(ls -lAFh | grep ".dotnet") ]]; then
        export DOTNET_ROOT="/opt/homebrew/bin"
        export PATH="$PATH:$DOTNET_ROOT:$HOME/.dotnet/tools"
    fi

    ##### NVM #####
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    ##### DART #####
    ## [Completion]
    ## Completion scripts setup. Remove the following line to uninstall
    [[ -f $HOME/.config/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.config/.dart-cli-completion/zsh-config.zsh || true
    ## [/Completion]

    ##### ZSH #####
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # source /opt/homebrew/share/zsh-completions/zsh-completions.zsh
    # History setup 
    HISTFILE=$HOME/.zhistory
    SAVEHIST=1000
    HISTSIZE=999
    setopt share_history
    setopt hist_expire_dups_first
    setopt hist_ignore_dups
    setopt hist_verify
elif [[ "$hostOS" == "$linux" ]]; then
    ##### EDITOR #####
    export VISUAL="/usr/bin/nvim"

    ##### PATH #####
    export PATH="$HOME/.local/bin:$PATH"
    ##### EMACS #####
    [[ -d ~/.config/emacs/bin ]] && export PATH="$HOME/.config/emacs/bin:$PATH"


    ##### DOTNET #####
    if [[ $(ls -lAFh | grep ".dotnet") ]]; then
        export DOTNET_ROOT="/usr/local/share/dotnet"
        export PATH="$PATH:$DOTNET_ROOT:$HOME/.dotnet/tools"
    fi

    ##### ZSH #####
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

##### FZF #####
# if statement
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended --multi --preview 'cat {}'"
export FZF_CTRL_COMMAND="find . -printf '%P\\n'"

##### ZOXIDE #####
eval "$(zoxide init zsh)"
export _ZO_DATA_DIR="$HOME/.config/zoxide"
export _ZO_ECHO=1

##### EZA Autocompletions #####
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

##### OH-MY-ZSH #####
export ZSH="$HOME/.oh-my-zsh"
if [[ "$hostOS" == "$macOS" ]]; then
    plugins=(
        aliases
        dotnet
        kubectl
        podman
        rust
        zoxide
    )
elif [[ "$hostOS" == "$linux" ]]; then
    plugins=(
        ##### DISABLED #####
        # aliases
        # fzf
        # git
        # ssh
        ##### ENABLED #####
        # archlinux
        # docker
        # dotnet
        # kubectl
        # pip
        # podman
        # rust
        # zoxide
    )
fi



source $ZSH/oh-my-zsh.sh

##### ALIASES #####
source ~/.dotfiles/shell/.aliases.sh

##### STARSHIP #####
eval "$(starship init zsh)"

##### KEYBINDS #####
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^O' edit-command-line

##### COMPLETERS #####
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)


if [[ $(uname -s) = "Darwin" ]]; then
    # Added by LM Studio CLI (lms)
    export PATH="$PATH:/Users/raphi/.lmstudio/bin"
    # End of LM Studio CLI section
fi


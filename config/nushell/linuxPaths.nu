##### EDITOR #####
$env.VISUAL = "/usr/bin/nvim"
# export VISUAL="/usr/bin/nvim"


##### MANPAGER #####
$env.MANPAGER = "nvim +Man!"
# export MANPAGER='nvim +Man!'


##### PATH + VARS #####
$env.PATH = ($env.PATH | prepend ~/.local/bin)
# export PATH="$HOME/.local/bin:$PATH"


##### C# PATH #####
if ("~/.dotnet" | path exists) {
    $env.DOTNET_ROOT = "/usr/local/share/dotnet"
    load-env {
        "PATH": ($env.PATH | append $env.DOTNET_ROOT | append "~/.dotnet/tools")
    }

    # export DOTNET_ROOT="/opt/homebrew/bin"
    # export PATH="$PATH:$DOTNET_ROOT:$HOME/.dotnet/tools"
}


##### FZF #####
#if (la -la | where name == ".fzf") {
    #    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#   export FZF_DEFAULT_OPS="--extended"
#   export FZF_CTRL_COMMAND="find . -printf '%P\\n'"
#}


##### STARSHIP #####
# eval "$(starship init zsh)"

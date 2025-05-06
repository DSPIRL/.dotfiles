. "$HOME/.cargo/env"

# Added by Toolbox App
if [[ $(uname -s) = "Linux" ]]; then
    export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
fi

if [[ $(uname -s) = "Darwin" ]]; then
    # Added by LM Studio CLI (lms)
    export PATH="$PATH:/Users/raphi/.lmstudio/bin"
    # End of LM Studio CLI section
fi

##### ZOXIDE #####
# zoxide init nushell | save -f ~/.zoxide.nu

##### CARAPACE #####
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

source ~/.cargo/bin/env.nu

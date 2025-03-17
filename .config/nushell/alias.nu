##### CORE #####
alias core-ls = ls
alias core-cd = cd

##### CUSTOM REDEFINITIONS #####
def ls [] {
    core-ls -la | select name type mode user group size modified
}

alias cd = z


##### CUSTOM FUNCTIONS #####
#ef tms [] {
#   tmux new-session -d -s GoodSesh
#   tmux new-window -t GoodSesh:1 -n 'Terminal'
#   tmux new-window -t GoodSesh:2 -n 'Neovim'
#   tmux attach-session -t GoodSesh
#


##### TESTING #####
alias modstat = nu ~/.config/nushell/modstat.nu
alias modhelp = cat ~/.dotfiles/shell/manpages/help_chmod.md

def greet [...names] { 
    $names | each {
        |el|
        (echo $"Hello ($el)") 
    }
}


##### ALIAS #####
alias cls = clear
alias l = eza -lhAF --color=auto --icons=always

alias exifall = exiftool -all=
alias exifkeepicc = exiftool -all= --icc_profile:all

alias nv = nvim

alias k = kubectl

#alias tmux-start = tmux new-session -d -s GoodSesh; tmux new-window -t GoodSesh::1 -n 'Terminal'; tmux new-window -t GoodSesh:2 -n 'Neovim'; tmux attach-session -t GoodSesh;

alias glols = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat

def special-ls [] {
    ls -la | select name type mode user group size modified;
}

##### TESTING #####
def greet [...names] { 
    $names | each {
        |el|
        (echo $"Hello ($el)") 
    }
}

def modstat [...files] {
    let test_table = ["Filename", "Filetype", "Exec Modes", "Hex Values"];
}


alias cls = clear
alias core-ls = ls
alias ls = special-ls
alias l = eza -lhAF --color=auto --icons=always

alias exifall = exiftool -all=
alias exifkeepicc = exiftool -all= --icc_profile:all

alias nv = nvim

#alias tmux-start = tmux new-session -d -s GoodSesh; tmux new-window -t GoodSesh::1 -n 'Terminal'; tmux new-window -t GoodSesh:2 -n 'Neovim'; tmux attach-session -t GoodSesh;

alias glols = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat


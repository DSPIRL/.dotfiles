##### SYSTEM #####
alias sls="eza -lhAF --color=auto --icons=always"
alias cd="z"
alias cls="clear"
alias modhelp="cat ~/.dotfiles/shell/manpages/help_chmod"
if [ $(uname -s) = "Darwin" ]; then
    alias modstat='stat -f "File name: %N
File type: %T
Execution modes: %i
Hex values: %Lp"'
elif [ $(uname -s) = "Linux" ]; then
 alias modstat='stat -c "File name: %n
File type: %F
Execution modes: %A
Hex values: %a"'
fi

##### EXIFTOOL #####
alias exifall="exiftool -all="
alias exifkeepicc="exiftool -all= --icc_profile:all"

##### EDITOR #####
alias nv="nvim"

##### OVERRIDES ######
alias grep="grep --color=auto"

##### GIT #####
alias gittree="git log --pretty=format:'%p %h' --graph"

##### TMUX #####
alias tmux-start="tmux new-session -d -s GoodSesh; tmux new-window -t GoodSesh::1 -n 'Terminal'; tmux new-window -t GoodSesh:2 -n 'Neovim'; tmux attach-session -t GoodSesh;"

##### EMACS #####
alias emacs="emacsclient -c -a 'emacs'"

##### PYTHON #####
if [ $(uname -s) = "Darwin" ]; then
    alias python="python3"
    alias pip="pip3"
    # alias pypy="pypy3.10"
fi









## remove old commits
# git rebase -i HEAD~4

## replace a string in a file's branch
# git filter-branch --tree-filter "sed -i 's/243248324293938243/putYaOwnApiKeyBrothar/' your/file/here" --tag-name-filter cat --all

## remove a file from git history
# git filter-branch --force --index-filter \
# "git rm --cached --ignore-unmatch PATH-TO-YOUR/.env" \
# --prune-empty --tag-name-filter cat -- --all

## remove the repo from the cache and re-add it
# FIRST
# git rm -rf --cached gitrepo/
# THEN
# git add gitrepo/


##### oh-my-posh ######
# alias posh='oh-my-posh'

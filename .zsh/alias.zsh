# alias
alias ls='ls -a -G'

## docker
alias dl='docker ps -l -q'
alias da='docker ps -a'
alias dat='docker attach `dl`'

## bear
alias bear='~/dotfiles/scripts/bear.swift'

alias ce='cd ../'
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -la'
alias sl="ls"

alias grep='grep --color=always'
alias ngrep='grep -n --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'

alias less='less -R'

# alias for vim
alias vi='vim -u $HOME/.virc'
sw_vers=`which sw_vers 2>&1`
if [[ $? == 0 ]]; then
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

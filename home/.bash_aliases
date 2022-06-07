no_untracked_files() {
    result=$(git status | grep '^Untracked files' | wc -l)
    [ $result -gt 0 ] &&  echo "Untracked files found."
    return $result
}



alias green='no_untracked_files && git commit -am green && git status'
alias yellow='no_untracked_files && git commit -am yellow && git status'
alias red='no_untracked_files && git commit -am red && git status'

alias gp='git push'
alias gs='git status'
alias ga='git add * && git status'
alias gc='no_untracked_files && git commit -m'

alias env-obdev='source $DEV_ROOT/obdev/scripts/setenv'

alias fl='flow list'
alias fp='flow push'
alias fa='flow append'

alias lsa='ls -A --color=auto'
alias vba='vim ~/.bash_aliases'
alias sba='source ~/.bash_aliases'
alias vvc='vim ~/.vimrc'

echo '.bash_aliases finished.'


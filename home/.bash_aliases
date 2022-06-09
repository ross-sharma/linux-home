_no_untracked_files() {
    result=$(git status | grep '^Untracked files')
    [ $result -ne 0 ] &&  echo "Untracked files found."
    return $result
}


_commit() {
    _no_untracked_files && 
        git commit -am "$*" && 
        git status
}


alias green='_no_untracked_files && git commit -am green && git status'
alias yellow='_no_untracked_files && git commit -am yellow && git status'
alias red='_no_untracked_files && git commit -am red && git status'

alias gp='git push'
alias gs='git status'
alias ga='git add * && git status'
alias gc='commit'

alias env-obdev='source $DEV_ROOT/obdev/scripts/setenv'
alias env-lh='source $LH_ROOT/scripts/setenv'

alias fl='flow list'
alias fp='flow push'
alias fa='flow append'

alias lsa='ls -A --color=auto'
alias vba='vim ~/.bash_aliases'
alias sba='source ~/.bash_aliases'
alias vrc='vim ~/.vimrc'

alias check='echo $?'

can-install() {
    $1 2>&1 | `tail -n 1`
}

echo '.bash_aliases finished.'


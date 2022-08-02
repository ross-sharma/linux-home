_no_untracked_files() {
    git status | 
      grep '^Untracked files'   &&
      echo "Untracked files found." &&
      return 1
    return 0
}


_commit() {
    _no_untracked_files && 
        git commit -am "$*" && 
        git status
}


alias gp='git push'
alias gs='git status'
alias gd='git diff'

alias env-obdev='cd $DEV_ROOT/obdev && source scripts/setenv'
alias env-webapp='cd $DEV_ROOT/webapp && source .obdev/setenv'
alias env-lh='source $LH_ROOT/scripts/setenv'
alias obtest='scripts/test'

alias fl='flow list'
alias fp='flow push'
alias fa='flow append'

alias lsa='ls -A --color=auto'
alias vba='vim ~/.bash_aliases'
alias sba='source ~/.bash_aliases'
alias vrc='vim ~/.vimrc'

alias check='echo $?'


echo '.bash_aliases finished.'


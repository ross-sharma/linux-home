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

alias lsl='ls -al --color=auto'

alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias lsa='ls -A --color=auto'
alias lsal='ls -Al --color=auto'
alias check='echo $?'

DEV=/mnt/c/dev

alias dev="cd $DEV"
alias vg="cd $DEV/voterguide"
alias vgvol="cd $DEV/voterguide/services/volunteers_frontend"
alias vgpub="cd $DEV/voterguide/services/public_frontend"
alias vgadm="cd $DEV/voterguide/services/public_admin"

alias
echo '.bash_aliases finished.'


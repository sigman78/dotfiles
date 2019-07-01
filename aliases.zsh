# Shortcuts
alias cd~=cd ~
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
weather() { curl -4 wttr.in }
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Fuzzy search + cd
alias cdf='cd $(dirname $(fzf))'
alias cdd='cd $(fd --type d --follow --hidden | fzf)'

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias dev="cd $HOME/dev"

# Vagrant
# alias v="vagrant global-status"
# alias vup="vagrant up"
# alias vhalt="vagrant halt"
# alias vssh="vagrant ssh"
# alias vreload="vagrant reload"
# alias vrebuild="vagrant destroy --force && vagrant up"

# Docker
alias docker-composer="docker-compose"
#alias dstop="docker stop $(docker ps -a -q)"
#alias dpurgecontainers="dstop && docker rm $(docker ps -a -q)"
#alias dpurgeimages="docker rmi $(docker images -q)"
#dbuild() { docker build -t=$1 .; }
#dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Git
alias commit="git add . && git commit -m"
alias gcommit="git add . && git commit"
alias wip="commit wip"
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gl="git log --oneline --decorate --color"
alias gnuke="git clean -df && git reset --hard"
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

### Fast git-lfs support
 
# Convenient aliases
alias enable_smudge='git config --global filter.lfs.smudge "git-lfs smudge -- %f" && printf "\nSmudge filter enabled.\n"'
alias enable_filter_process='git config --global filter.lfs.process "git-lfs filter-process" && printf "Filter process enabled.\n"'
alias disable_smudge='git config --global filter.lfs.smudge "git-lfs smudge --skip %f" && printf "Smudge filter disabled.\n"'
alias disable_filter_process='git config --global filter.lfs.process "git-lfs filter-process --skip" && printf "Filter process disabled.\n"'
alias lfs_cleanup='git lfs fetch; git lfs checkout'
alias print_warning='printf "Attention: if process was terminated outside, run fix_lfs_config and clear_branch to enable smudge filter and filter-process back.\n"'
alias clear_branch='git add .; git reset --hard; git clean -df'
  
# Fast pull
fpull() {
    print_warning
    disable_smudge
    disable_filter_process
    git pull
    lfs_cleanup
    enable_smudge
    enable_filter_process
}
  
# Fast checkout
fcheck() {
    print_warning
    disable_smudge
    disable_filter_process
    git checkout $1
    lfs_cleanup
    enable_smudge
    enable_filter_process
}
  
# Fast checkout and pull
fcheckp() {
    print_warning
    disable_smudge
    disable_filter_process
    git checkout $1 && git pull
    lfs_cleanup
    enable_smudge
    enable_filter_process
}
  
# Resetting git-lfs config to default
fix_lfs_config() {
    enable_smudge
    enable_filter_process
}


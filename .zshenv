# ========================================
# Author: Theerawat Kiatdarakun
#
# Welcome to .zshenv
# executed when creating any shell
#
# I put non-interactive stuffs that might
# change over time here
# ========================================
# original configs =============================
export LC_CTYPE="en_US.UTF-8"
export EDITOR=vim
setopt autocd # no need to type cd to change dir
umask 027
# ----------------------------------------
# golang =================================
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
# ----------------------------------------
# nvm ====================================
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# ----------------------------------------
# ruby ===================================
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
# ----------------------------------------
# scripts ================================
local git_dir=~/Git
if [ -d $git_dir/scripts/ ]; then
  for dir in $git_dir/scripts/*; do
    if [[ $(basename $dir) == bash || $(basename $dir) == python ]]; then
      export PATH=$PATH:$dir
    fi
  done
fi
# ----------------------------------------

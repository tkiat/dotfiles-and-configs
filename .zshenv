# Reference: http://zsh.sourceforge.net/Doc/Release/index.html
# ========================================
# Author: Theerawat Kiatdarakun
#
# Welcome to .zshenv
# executed when creating any shell
#
# I put non-interactive stuffs that may
# change after logging in here
# ========================================
# My Configs =============================
export LC_CTYPE="en_US.UTF-8"
setopt autocd # no need to type cd to change dir
umask 027
# ----------------------------------------
# Scripts ================================
local git_dir=~/Git
if [ -d $git_dir/scripts/ ]; then
  for dir in $git_dir/scripts/*; do
    if [[ $(basename $dir) == bash || $(basename $dir) == python ]]; then
      export PATH=$PATH:$dir
    fi
  done
fi
# ----------------------------------------
# go =====================================
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
# ----------------------------------------
# serverless framework ===================
export PATH="$HOME/.serverless/bin:$PATH"
# ----------------------------------------
# nvm ====================================
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# ----------------------------------------
# fzf ====================================
source /usr/share/doc/fzf/completion.zsh # e.g. cd **<tab>
export FZF_DEFAULT_COMMAND="ag --depth 4 --hidden --ignore .git -f -g \"\""
export FZF_DEFAULT_OPTS="--layout=reverse --exact"
# ----------------------------------------
# ruby ===================================
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
# ----------------------------------------

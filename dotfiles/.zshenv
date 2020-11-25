# ========================================
# Author: Theerawat Kiatdarakun
#
# Welcome to .zshenv
# executed when creating any shell
#
# I put non-interactive stuffs that might
# change over time here
# ========================================
setopt autocd # no need to type cd
# original configs =======================
function surf {
	if [ -z "$1" ]; then
		/home/$USER/Git/suckless-surf/surf-open.sh www.google.com
	else
		/home/$USER/Git/suckless-surf/surf-open.sh $1
	fi
}
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
# guix ===================================
#export PATH=/home/$USER/.guix-profile/bin:$PATH # dmenu
# ----------------------------------------
# mozbuild ===============================
# export PATH=~/.mozbuild/git-cinnabar:$PATH
# ----------------------------------------
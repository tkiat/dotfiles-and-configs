# ========================================
# Author: Theerawat Kiatdarakun
#
# Welcome to .zshenv
# executed when creating any shell
#
# I put non-interactive stuffs that might
# change over time here
# ========================================
# original configs =======================
# alias surf='/home/$USER/Git/forked-surf/surf-open.sh www.google.com'
function surf {
	if [ -z "$1" ]; then
		/home/$USER/Git/suckless-surf/surf-open.sh www.google.com
	else
		/home/$USER/Git/suckless-surf/surf-open.sh $1
	fi
}
# export LC_CTYPE="en_US.UTF-8"
# export EDITOR=vim
setopt autocd # no need to type cd
# umask 027
# ----------------------------------------
#
#
#=========== external config =============
#
#

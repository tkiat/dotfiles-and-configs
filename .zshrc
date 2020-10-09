# ========================================
# Reference: http://zsh.sourceforge.net/Doc/Release/index.html
# Author: Theerawat Kiatdarakun
# Welcome to .zshrc
# I put everything interactive here
# ========================================
export EDITOR=
local apps_cli_dir=/mnt/shared/Apps-Linux/CLI
local dotfile_dir=/mnt/shared/Git/dotfiles
local line_str="----------------------------------------"
# Aliases ================================
# overwite default
alias    ...="cd ../.."
alias    ls="ls --color --group-directories-first"
alias    mc="EDITOR=vim mc"
# alternative to default
alias    sl="ls"
# bind
function 2b {
for dir in dev proc run sys
do
	echo "mounting /$dir to $1/$dir ..."
	sudo mkdir -p $1/$dir
	sudo mount --rbind /$dir $1/$dir
	sudo mount --make-rslave $1/$dir
done
}
# change
alias    2c-brightness="[ -x '$(command -v xrandr)' ] && xrandr --output LVDS-1 --brightness"
function 2c-tab-title { echo -en "\e]2;$1\a" }
# clear cache
alias    2cc-go="go clean -cache -modcache -i -r"
# copy to clipboard
function 2c-clipboard-c {
	xclip -o | xclip -selection clipboard
}
# alias    2c-file_to_clipboard="xclip -sel clip"
function 2c-file-c {
	echo $1 xclip -selection clipboard
}
# display
alias    2d-filesize="du -sh ./* | sort -h"
function 2d-git-status-all { for x in *; do echo $line_str && echo "Folder name: ${x}" && echo $line_str && git --work-tree=$x --git-dir=$x/.git status; done }
# edit
alias    2e-.tmux.conf="[ -x '$(command -v tmux)' ] && vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"
alias    2e-.vimrc="vim -o $dotfile_dir/.vimrc ~/.vimrc"
alias    2e-.xinitrc="vim -o $dotfile_dir/.xinitrc ~/.xinitrc"
alias    2e-.zshenv="vim -o $dotfile_dir/.zshenv ~/.zshenv && source ~/.zshenv"
alias    2e-.zshrc="vim -o $dotfile_dir/.zshrc ~/.zshrc && source ~/.zshrc"
alias    2e-dotfiles="vim $dotfile_dir"
# find
alias    2fs="find . -maxdepth 1 -type l" # symlink
# goto
function 2gt-symlink { cd $(dirname $(readlink $1)) }
# grep
alias    2gh="history 1 | grep "
# grub
alias    2gm="sudo grub-mkconfig -o /boot/grub/grub.cfg"
# kill
function 2k-port { sudo fuser -k $1/tcp }
# logout
alias    2logout="pkill -u $USER"
# run
function 2r {
	$1 > /dev/null 2>&1 &
	disown
}
# source
alias    2s-ansible="source $apps_cli_dir/ansible/hacking/env-setup"
# OS specific
if cat /etc/*-release | grep -q 'void'; then

	alias vim='gvim -v'

	alias 2i-pkg='sudo xbps-install'
	alias 2q-pkg='xbps-query -Rs'
	alias 2r-cache='sudo rm /var/cache/xbps/* && sudo xbps-remove -Oo'
	alias 2r-pkg='sudo xbps-remove -R'
	alias 2u-os='sudo xbps-install -Su'
elif cat /etc/*-release | grep -q 'Arch Linux'; then
	alias 2i-pkg='sudo pacman -S'
	alias 2q-pkg='pacman -Ss'
	alias 2r-cache='sudo pacman -Scc'
	alias 2r-pkg='sudo pacman -R'
	alias 2u-os='sudo pacman -Syu'
elif [ "$(uname)" '==' "FreeBSD" ]; then
	alias 2i-pkg='sudo pkg install'
	alias 2q-pkg='pkg search'
	alias 2r-pkg='sudo pkg delete'
	alias 2u-os='sudo freebsd-update fetch && sudo freebsd-update install'
fi
# ----------------------------------------
# History ================================
HISTFILE=~/.zsh_history
HISTSIZE=4000 # max entries in current-session memory
SAVEHIST=4000 # max entries in HISTFILE
setopt incappendhistory # immediately append to history file, not waiting until shell exits
setopt sharehistory # share history across terminals
# ----------------------------------------
# Keybinding ============================
bindkey "\e[3~" delete-char
# function zle-line-init () { echoti smkx }
# function zle-line-finish () { echoti rmkx }
# zle -N zle-line-init
# zle -N zle-line-finish
# ----------------------------------------
# LS_COLORS ==============================
# get and reset default value
# eval $(dircolors | head -1)
LS_COLORS=$(echo $LS_COLORS | sed -e 's/=[^=]*:/=0:/g')
# remap and export
LS_COLORS=$LS_COLORS'di=1;30;107:tw=1;30;107:ow=1;30;107:'
LS_COLORS=$LS_COLORS'ln=1;36:'
LS_COLORS=$LS_COLORS'*.7z=35:*.bz=35:*.bz2=35:*.gz=35:*.rar=35:*.tar=35:*.zip=35:'
export LS_COLORS
# ----------------------------------------
# Prompt =================================
# local emojis=('$' '( °Д°) ' '( •̀ω•́)つ' '(´＿- `)' '(๑•﹏•)⋆*' '( °Д°) ┻━┻' '(ﾉ´ヮ´)ﾉ*' 'ʕ •ᴥ•ʔ' '(˘ ³˘)♥' '(っ˘з(˘⌣˘)' '(ɔˆз(ˆ⌣ˆc)' '( ˘⌣˘)♡' '(¬_¬ )')
# local emoji=$emojis[$(($RANDOM % ${#emojis[@]} + 1))]
# pick color of the day
local day=$(date +%u) # Mon(1)-Sun(7)
local colors=(11 165 046 208 014 129 196); local color=$colors[day]
local colors_light=(227 213 121 180 123 099 124); local color_light=$colors_light[day]
# git
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '(%a'$'\UE0A0''%b)' # used when git detected and e.g. rebase/merge conflict
zstyle ':vcs_info:*' formats '%F{'$color_light'}:git@%b%f'
# zstyle ':vcs_info:*' formats '%F{'$color_light'}:%n/%r/%b%f' # used when git detected and actionformats is inactive
# \UE0A0
setopt PROMPT_SUBST
precmd () { vcs_info }
# modify prompt
PROMPT='%F{'$color_light'}%n@'$HOST':%F{'$color'}%0 %1~%f'
PROMPT='%B'$PROMPT'%(!.(root).)'\$vcs_info_msg_0_'%b: '
# PROMPT='%B'$PROMPT'%(!.(root).)'\$vcs_info_msg_0_'%b%(60l.'$'\n''.)${emoji} '
# ----------------------------------------
# Tab Completion =========================
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# ----------------------------------------
#
#
#=========== external config =============
#
#

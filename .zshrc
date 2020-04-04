# Original Docs: http://zsh.sourceforge.net/Doc/Release/index.html
# helper variables
local mydir="/run/media/tkiatd/Shared"
# history file
	# history file path
HISTFILE=~/.zsh_history
	# max number of history entries to keep in current-session memory
HISTSIZE=1000
	# max number of history entries to save to HISTFILE
SAVEHIST=1000
	# append to history file, not overwrite
# setopt appendhistory
	# immediately append to history file, not waiting until shell exits
setopt incappendhistory
	# share history across terminals
setopt sharehistory
# git
	# load function vcs_info
autoload -Uz vcs_info
	# enable vcs_info_msg_0_
setopt PROMPT_SUBST
precmd () { vcs_info }
	# style vcs_info
		# actionformats active when e.g. rebase/merge conflict
zstyle ':vcs_info:*' actionformats '(%a'$'\UE0A0''%b)'
		# formats used when actionformats is inactive
zstyle ':vcs_info:*' formats '(%s'$'\UE0A0''%b)'
# prompt
	# pick color of the day (in Thailand)
colors=(red yellow 165 46 208 14 129)
day=$(date +%u)
color=$colors[day+1]
	# modify prompt
PROMPT='%F{'$color'}%0 %1 %2~%f'
PROMPT='%B'$PROMPT'%(!.(root).)'\$vcs_info_msg_0_'$%b '
# autocompletion case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# include in PATH
export PATH=$PATH:$mydir/Git/script/shell
# default apps
export EDITOR=vim
# source other files
source .aliases

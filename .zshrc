# Reference: http://zsh.sourceforge.net/Doc/Release/index.html
# helper variables
local mydir="/run/media/tkiatd/Shared"
local colors=(226 165 46 208 14 129 red)
local emojis=('$' '(ノ°Д°)ノ' '(つ•̀ω•́)つ' '(´＿｀)' '(๑•﹏•)⋆*' '(ノ°Д°)ノ┻━┻' '(ﾉ´ヮ´)ﾉ*' 'ʕ •ᴥ•ʔ' '(˘ ³˘)♥' '(っ˘з(˘⌣˘)' '(ɔˆз(ˆ⌣ˆc)' '( ˘⌣˘)♡' '(¬_¬ )')
# pick Thailand's'color of the day (for prompt)
local day=$(date +%u) # Mon(1)-Sun(7)
local color=$colors[day]
# pick emoji (for prompt)
local emoji=$emojis[$(($RANDOM % ${#emojis[@]} + 1))]
# history file
HISTFILE=~/.zsh_history # history file path
HISTSIZE=1000 # max number of history entries to keep in current-session memory
SAVEHIST=1000 # max number of history entries to save to HISTFILE
setopt incappendhistory # immediately append to history file, not waiting until shell exits
setopt sharehistory # share history across terminals
# load and style function vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '(%a'$'\UE0A0''%b)' # used when git detected and e.g. rebase/merge conflict
zstyle ':vcs_info:*' formats '(%n/%r'$'\UE0A0''%b)' # used when git detected and actionformats is inactive
#zstyle ':vcs_info:*' nvcsformats ${emoji} # used when no git detected
# enable vcs_info_msg_0_
setopt PROMPT_SUBST
precmd () { vcs_info }
# modify prompt
PROMPT='%n@'$HOST':%F{'$color'}%0 %1~%f'
PROMPT='%B'$PROMPT'%(!.(root).)'\$vcs_info_msg_0_'%b%(60l.'$'\n''.)'${emoji}' ' #%(!.(root).)
# case-insensitive autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# include in PATH
export PATH=$PATH:$mydir/Git/script/shell
# set default apps
export EDITOR=vim
# source other files
source ~/.aliases

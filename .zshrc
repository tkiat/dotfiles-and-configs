# Reference: http://zsh.sourceforge.net/Doc/Release/index.html
setopt autocd
# ========================================
#                                  Aliases
# ========================================
source ~/.aliases
# shell command
alias ls='ls --color'
function 2change-tab-title { echo -en "\e]2;$1\a" }
# ========================================
#                           Autocompletion
# ========================================
# Case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# ========================================
#                                   Export
# ========================================
local mydir="/run/media/tkiatd/Shared"

export EDITOR=vim
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH=$PATH:$mydir/Git/script/shell
# ========================================
#                                 History
# ========================================
HISTFILE=~/.zsh_history
HISTSIZE=1000 # max entries in current-session memory
SAVEHIST=1000 # max entries in HISTFILE
setopt incappendhistory # immediately append to history file, not waiting until shell exits
setopt sharehistory # share history across terminals
# ========================================
#                              Key Binding
# ========================================
bindkey "\e[3~" delete-char
# ========================================
#                               $LS_COLORS
# ========================================
# get and reset default value
eval $(dircolors | head -1)
LS_COLORS=$(echo $LS_COLORS | sed -e 's/=[^=]*:/=0:/g')
# remap and export
LS_COLORS=$LS_COLORS'di=1;44:tw=1;44:ow=1;44:'
LS_COLORS=$LS_COLORS'ln=1;36:'
LS_COLORS=$LS_COLORS'*.7z=35:*.bz=35:*.bz2=35:*.gz=35:*.rar=35:*.tar=35:*.zip=35:'
export LS_COLORS
# ========================================
#                                   Prompt
# ========================================
# pick emoji
local emojis=('$' '(ノ°Д°)ノ' '(つ•̀ω•́)つ' '(´＿｀)' '(๑•﹏•)⋆*' '(ノ°Д°)ノ┻━┻' '(ﾉ´ヮ´)ﾉ*' 'ʕ •ᴥ•ʔ' '(˘ ³˘)♥' '(っ˘з(˘⌣˘)' '(ɔˆз(ˆ⌣ˆc)' '( ˘⌣˘)♡' '(¬_¬ )')
local emoji=$emojis[$(($RANDOM % ${#emojis[@]} + 1))]
# pick color of the day
local day=$(date +%u) # Mon(1)-Sun(7)
local colors=(11 165 046 208 014 129 196); local color=$colors[day]
local colors_light=(230 213 121 180 123 099 124); local color_light=$colors_light[day]
# git
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '(%a'$'\UE0A0''%b)' # used when git detected and e.g. rebase/merge conflict
zstyle ':vcs_info:*' formats '(%F{'$color_light'}%n/%r'$'\UE0A0''%b%f)' # used when git detected and actionformats is inactive
setopt PROMPT_SUBST
precmd () { vcs_info }
# modify prompt
PROMPT='%F{'$color_light'}%n@'$HOST'%f:%F{'$color'}%0 %1~%f'
PROMPT='%B'$PROMPT'%(!.(root).)'\$vcs_info_msg_0_'%b%(60l.'$'\n''.)'${emoji}' '

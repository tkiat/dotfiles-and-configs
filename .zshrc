# Reference: http://zsh.sourceforge.net/Doc/Release/index.html
[ -f ~/.zshrc.aliases ] && source ~/.zshrc.aliases
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.program ] && source ~/.zshrc.program
setopt autocd
umask 027
local line_str="----------------------------------------"
# ========================================
#                           Autocompletion
# ========================================
# Case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# ========================================
#                                   Export
# ========================================
export LC_CTYPE="en_US.UTF-8"
export EDITOR=vim
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
# export GOROOT=/usr/local/go
#nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
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
LS_COLORS=$LS_COLORS'di=1;30;47:tw=1;30;47:ow=1;30;47:'
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

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# TODO
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

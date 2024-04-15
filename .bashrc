# interactive session or not
[ -z "$PS1" ] && return

# TERM is only set outside of tmux
[ -z "$TMUX" ] && export TERM=xterm-256color

# alias
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

# bind
bind '"\C-o":"lfcd\C-m"'

# editor
export EDITOR=nvim
export VISUAL=nvim

# functions
mcd () { mkdir -p "$1" && cd "$1"; }
function shenv () {
	declare -p |
		awk '{print $3}'
}

# history
HISTCONTROL=ignoreboth #short for ignorespace:ignoredups
shopt -s histappend
HISTSIZE=3000
HISTFILESIZE=3000
HISTIGNORE="exit:clear"

# PS1
function setPrompt() {
	let error_code=$?
	fgGr='\e[00;32m'
	fgBr='\e[00;33m'
	fgPu='\e[00;35m'
	endC='\e[m'
	PS1="${fgGr}\u${endC}@${fgPu}\h${endC}:${fgBr}\w${endC}\n\$ " #- ${error_code} -
}

PROMPT_COMMAND=setPrompt

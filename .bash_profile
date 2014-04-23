# ------------------------
# environment variable
# ------------------------
set CLASSPATH=/usr/local/SaxonHE9-4-0-6J/   # put saxon in the path
export PATH=$PATH:/Applications/basex/bin   # put basex scripts in the path

# ------------------------
# color prefix
# ------------------------
NM="\[\033[0;38m\]" 
HI="\[\033[0;37m\]" 
HII="\[\033[0;36m\]" 
SI="\[\033[0;33m\]"
IN="\[\033[0m\]"

export PS1=" $HII\u $SI\w$NM $IN"
# activer la couleur
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LC_CTYPE="fr_FR.UTF-8"

# ------------------------
# bash history
# ------------------------
# History length.
HISTSIZE=1000
# Bash history file length.
HISTFILESIZE=10000
# Don't put duplicate lines in the history. See bash(1) for more
# options or force ignoredups and ignorespace.
HISTCONTROL=ignoredups:ignorespaec
# Append the history to the histfile instead of overwriting it.
shopt -s histappend
# Update & re-read histfile after every cmd so terminals will share.
# export PROMPT_COMMAND="history -n; history -a"
 

# ------------------------
# alias generic
# ------------------------
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ~='cd ~'

# ------------------------
# alias typos
# ------------------------
alias cd..='cd ..'

# ------------------------
# alias ls
# ------------------------
alias ll='ls -l'
alias ls='ls -hF'           # add colors for filetype recognition
alias la='ls -lah'          # show hidden files
alias lx='ls -lXBh'         # sort by extension
alias lk='ls -lSh'          # sort by size, biggest last
alias lt='ls -lth'          # sort by date, most recent first
alias ltr='ls -ltrh'        # sort by date, most recent last

# ------------------------
# alias perso
# ------------------------
alias safari='open -a "Safari"'     
alias chrome='open -a "Google Chrome"'
alias finder='open -a "Finder"'
alias firefox='open -a "Firefox"'
alias oxygen='open -a "/Applications/oxygen/Oxygen XML Editor.app"'
alias brackets='open -a "Brackets"'
alias xmplify='open -a "/Applications/Xmplify (1.3.4) (1.3.9).app"'


# ------------------------
# git
# ------------------------
# git autocompletion
source ~/.git-completion.bash

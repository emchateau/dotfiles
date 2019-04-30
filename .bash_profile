# ------------------------
# environment variable
# ------------------------
# put BaseX scripts in the path
export PATH=$PATH:~/Sites/basex/bin
# put the TEI XSL Stylesheets in the path
export PATH=$PATH:~/TEIC/Stylesheets/bin
# find the current user top java version specified in Java Preferences
export JAVA_HOME=$(/usr/libexec/java_home)
# use gem user directory (gems installed with --user-install)
if which ruby >/dev/null && which gem >/dev/null; then
       PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
    fi
# set the java classpath
export CLASSPATH=$CLASSPATH:"/Library/Java/Extensions/SaxonHE9-8-0-3J/saxon9he.jar":"Library/Java/Extensions/SaxonHE9-8-0-3J/saxon9-xqj.jar":"Library/Java/Extensions/jing-trang/build/jing.jar"

# ------------------------
# color prefix
# ------------------------
# NM="\[\033[0;38m\]"
# HI="\[\033[0;37m\]"
# HII="\[\033[0;36m\]"
# SI="\[\033[0;33m\]"
# IN="\[\033[0m\]"

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PINK="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
GRAY="\[\033[0;37m\]"

DEFAULT="\[\033[0m\]"


# ------------------------
# prompt
# ------------------------

export PS1=" $HII\u $SI\w$NM $IN"

# activer la couleur
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# encoding
# export LC_CTYPE="fr_FR.UTF-8"

# ------------------------
# dynamic prompt
# from https://github.com/lucasb-eyer/dotfiles/blob/master/_bash/setprompt.bash
# ------------------------

# prompt_command () {
#     local err_prompt=`prt_ret`
#     export PS1="${err_prompt}`prt_virtualenv`[`prt_username`@`prt_hostname`:`prt_dir` `prt_time`]`prt_git`\n${BLUE}$ ${DEFAULT}"
# }

prompt_command () {
	export PS1="`prt_virtualenv` `prt_username` `prt_dir` `prt_git`${DEFAULT}"
}

PROMPT_COMMAND=prompt_command

prt_ret () {
    RET=$?
    if [ $RET -ne 0 ]; then
        echo "${RED}O.o ${RET} ${DEFAULT}"
    else
        echo "${TEST}:) ${DEFAULT}"
    fi
}

prt_virtualenv () {
    if [ $VIRTUAL_ENV ]; then
        d=`dirname $VIRTUAL_ENV`
        parent="`basename $d`/`basename $VIRTUAL_ENV`"
        pyenv="${PINK}($parent)${DEFAULT} "
    fi

    # Node.js virtualenvs (created using nodeenv from pypi)
    if [ $NODE_VIRTUAL_ENV ]; then
        d=`dirname $NODE_VIRTUAL_ENV`
        parent="`basename $d`/`basename $NODE_VIRTUAL_ENV`"
        nodeenv="${PINK}($parent)${DEFAULT} "
    fi

    # Go directories
    if [ $GOPATH ]; then
        d=`dirname $GOPATH`
        name="`basename $d`/`basename $GOPATH`"
        goenv="${PINK}($name)${DEFAULT}"
    fi

    echo "$pyenv$nodeenv$goenv"
}

prt_git () {
    # Check if inside a git repo
    git branch > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        return 0
    fi

    # Capture the output of the "git status" command.
    git_status=`git status 2> /dev/null`

    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "working directory clean" ]]; then
        state="${GREEN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        state="${YELLOW}"
    else
        state="${RED}"
    fi

    # Set arrow icon based on status against remote.
    remote_pattern="# Your branch is (.*)"
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
        if [[ ${BASH_REMATCH[1]} == "ahead of" ]]; then
            remote="↑"
        else
            remote="↓"
        fi
    else
        remote=""
    fi
    diverge_pattern="# Your branch and (.*) have diverged"
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
        remote="↕"
    fi

    # Get the name of the branch.
    branch_pattern="^On branch ([^${IFS}]*)"
    if [[ ${git_status} =~ ${branch_pattern} ]]; then
         branch=${BASH_REMATCH[1]}
    fi

    # Set the final branch string.
    echo "${state}(${branch})${remote} ${DEFAULT}"
}


prt_username () {
    who=`whoami`
    if [ $who = "root" ]; then
        echo "${BRED}${who}${DEFAULT}"
    else
        echo "${CYAN}${who}${DEFAULT}"
    fi
}

prt_hostname () {
    echo "${BLUE}\h${DEFAULT}"
}

prt_dir () {
    echo "${YELLOW}\w${DEFAULT}"
}

prt_time () {
    val=`date +"%k:%M:%S"`
    echo "${YELLOW}$val${DEFAULT}"
}


# ------------------------
# bash history
# ------------------------
# History length.
HISTSIZE=1000
# Bash history file length.
HISTFILESIZE=1000
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

# ------------------------
# alias typos
# ------------------------
alias cd..='cd ..'
alias cd~='cd ~'

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
# alias chrome='open -a "Google Chrome"'
alias finder='open -a "Finder"'
alias firefox='open -a "Firefox"'
alias oxygen='open -a "/Applications/oxygen20/Oxygen XML Editor.app"'
# alias brackets='open -a "Brackets"'
alias xmplify='open -a "/Applications/Xmplify.app"'
alias sublime='open -a "/Applications/Sublime Text 2"'

# ------------------------
# git
# ------------------------
# git autocompletion
source ~/.git-completion.bash

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

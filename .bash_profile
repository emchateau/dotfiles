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
# if which ruby >/dev/null && which gem >/dev/null; then
#       PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#    fi

# set the java classpath
# export CLASSPATH=$CLASSPATH:"/Library/Java/Extensions/SaxonHE9-8-0-3J/saxon9he.jar":"Library/Java/Extensions/SaxonHE9-8-0-3J/saxon9-xqj.jar":"Library/Java/Extensions/jing-trang/build/jing.jar"

export PATH="/usr/local/opt/ruby/bin:$PATH"

export CLASSPATH=$CLASSPATH:"/Library/Java/Extensions/SaxonEE9-9-1-5J/saxon9ee.jar":"Library/Java/Extensions/SaxonEE9-9-1-5J/saxon9ee.jar":"Library/Java/Extensions/SaxonEE9-9-1-5J/icu4j-59_1.jar":"Library/Java/Extensions/SaxonEE9-9-1-5J/saxon9ee-test.jar":"Library/Java/Extensions/SaxonEE9-9-1-5J/saxon-license.lic":"Library/Java/Extensions/jing-trang/build/jing.jar"

export SAXON_HOME="/Library/Java/Extensions/SaxonEE9-9-1-5J"

PATH=~/xspec/bin:$PATH

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/emmanuelchateau/.gem/ruby/2.7.0/bin:$PATH"

# ------------------------
# color prefix
# ------------------------

# red=$(tput setaf 1);
# orange=$(tput setaf 220);
# blue=$(tput setaf 38);
# green=$(tput setaf 71);
# white=$(tput setaf 15);
# bold=$(tput bold);
# reset=$(tput sgr0);

red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
orange="\[\033[0;33m\]"
blue="\[\033[0;34m\]"
pink="\[\033[0;35m\]"
white="\[\033[0;36m\]"
bold=$(tput bold);
reset=$(tput sgr0);

# ------------------------
# prompt
# ------------------------

export PS1;

# activer la couleur
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# encoding
# export LC_CTYPE="fr_FR.UTF-8"

# ------------------------
# dynamic prompt
# from https://github.com/lucasb-eyer/dotfiles/blob/master/_bash/setprompt.bash
# from https://gist.github.com/hugorodgerbrown/4143150/f88c9312f64b81dc3ec1082c4d5d4a91e9372104
# ------------------------

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Detect whether the current directory is a git repository.
function is_git_repository {
  git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
  # Capture the output of the "git status" command.
  git_status="$(git status 2> /dev/null)"

  # Set color based on clean/staged/dirty.
  if [[ ${git_status} =~ "nothing to commit, working tree clean" ]]; then
    state="${green}"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${orange}"
  else
    state="${red}"
  fi

  # Set arrow icon based on status against remote.
  remote_pattern="Your branch is (.*) of"
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="↑"
    else
      remote="↓"
    fi
  fi
  diverge_pattern="Your branch is (.*) have diverged"
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
  fi

  # Get the name of the branch.
  branch_pattern="On branch ([^${IFS}]*)"
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
  fi

  # Set the final branch string.
  BRANCH="${state}(${branch})${remote}${COLOR_NONE} "
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
#function set_prompt_symbol () {
#  if test $1 -eq 0 ; then
#      PROMPT_SYMBOL="✩"
#  else
#      PROMPT_SYMBOL="${RED}✩${COLOR_NONE}"
#  fi
#}

# Set the full bash prompt.
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  #  set_prompt_symbol $?

  # Set the BRANCH variable.
  if is_git_repository ; then
    set_git_branch
  else
    BRANCH=''
  fi

  # Set the bash prompt variable.
  PS1="\[${bold}\]\n";
  PS1+="\[${pink}\]\u";
  PS1+="\[${white}\] @ ";
  PS1+="\[${blue}\]\h";
  PS1+="\[${white}\] in ";
  PS1+="\[${green}\]\W";
  PS1+=" \[${BRANCH}\]";
  PS1+="\n";
  PS1+="☆ \[${reset}\]";
 # PS1+="\[${PROMPT_SYMBOL}\] \[${reset}\]";

 # PS1="\u@\h \w ${BRANCH}${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt

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
alias oxygen='open -a "/Applications/Oxygen XML Editor/Oxygen XML Editor.app"'
# alias brackets='open -a "Brackets"'
alias xmplify='open -a "/Applications/Xmplify.app"'
alias sublime='open -a "/Applications/Sublime Text 2"'
alias webstorm='open -a "/Applications/WebStorm.app"'
alias vs='open -a "/Applications/Visual Studio Code.app"'
alias atom='open -a "/Applications/Atom.app"'
# alias julia="/Applications/Julia-1.4.app/Contents/Resources/julia/bin/julia"

# ------------------------
# git
# ------------------------
# git autocompletion
source ~/.git-completion.bash
alias git='LANG=en_US.UTF-8 git'

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
# added by Anaconda2 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/emmanuelchateau/opt/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/emmanuelchateau/opt/anaconda2/etc/profile.d/conda.sh" ]; then
# . "/Users/emmanuelchateau/opt/anaconda2/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/emmanuelchateau/opt/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/emmanuelchateau/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/emmanuelchateau/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/emmanuelchateau/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/emmanuelchateau/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


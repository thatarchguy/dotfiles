#
# ~/.bashrc
#

export TERM=xterm-256color
export BROWSER="firefox"
export EDITOR="vim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
if [ -f ~/.bash_aliases ]; then
	    source ~/.bash_aliases
	fi

if [ -f ~/.bash_work ]; then
	    source ~/.bash_work
	fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


if [ -f /usr/share/fzf/key-bindings.bash ]; then
  . /usr/share/fzf/key-bindings.bash
fi

if [ -f /usr/share/fzf/completion.bash ]; then
  . /usr/share/fzf/completion.bash
fi

#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

HISTSIZE=200000
HISTFILESIZE=30000
HISTFILE=~/.bash_mystery
shopt -s histappend

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}


[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
	    eval "`dircolors -b $DIR_COLORS`"




# nuke@arch (~) $:
#export PS1="\[$txtred\]\u@\[$bldblu\]\H \[$txtgrn\](\w)\$(parse_git_branch) \$: \[$txtrst\]"
source ~/.bash_prompt

#[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin/
EDITOR=vim

complete -cf sudo

# added by travis gem
[ -f /home/nuke/.travis/travis.sh ] && source /home/nuke/.travis/travis.sh

export GOPATH=$HOME/.go
export PATH=$PATH:/$HOME/.go/bin:/$HOME/.local/bin



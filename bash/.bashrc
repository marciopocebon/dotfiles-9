# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# list of all directories in which Linux will look for commands, scripts and programs
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.dotfiles/nostow/bin
export PATH

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

function include_d {
	dir=$1
	if [ -d $HOME/.dotfiles/bash/$dir.d -a -r $HOME/.dotfiles/bash/$dir.d -a -x $HOME/.dotfiles/bash/$dir.d ]; then
		for i in $HOME/.dotfiles/bash/$dir.d/*.sh; do
			 . $i
		done
	fi
}

include_d nostow/bash_functions
include_d nostow/bash_aliases
include_d nostow/bash_completion
include_d nostow/bash_settings

# Autocompletion for sudo
complete -cf sudo



# .bashrc file - Save this file as .bashrc in your home directory. (e.g. /home/user/.bashrc)

# Author: Chad Paradis

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# -- Shell Options --
# See man bash for more options...
PS1='[\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]]\$ '	# Custom colorful bash prompt

# -- Completion options --

# -- History Options --

# -- Aliases --

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias grep='grep --color'				# show differences in colour
alias egrep='egrep --color=auto'		# show differences in colour
alias fgrep='fgrep --color=auto'		# show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'			# classify files in colour
alias dir='ls --color --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'						# long list
# alias la='ls -A'						# all but . and ..
# alias l='ls -CF'
alias vim='vim -p'

# -- Umask --

# -- Functions --

# Soruce global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

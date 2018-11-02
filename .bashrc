
if [ -f ~/.bashrc_private ]; then
  . ~/.bashrc_private
fi

PS1="\h@\u:\W\$(__git_ps1) \$ "

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export COPYFILE_DISABLE=true

alias grep="grep --color=auto"

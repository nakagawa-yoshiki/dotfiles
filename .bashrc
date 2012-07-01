
if [ -f ~/.bashrc_private ]; then
  . ~/.bashrc_private
fi

source ~/.git-completion.bash
PS1="\h@\u:\W\$(__git_ps1) \$ "


if [ -f ~/.bashrc_private ]; then
  . ~/.bashrc_private
fi

. ~/.nvm/nvm.sh
nvm use v0.8.0

source ~/.git-completion.bash
PS1="\h@\u:\W\$(__git_ps1) \$ "

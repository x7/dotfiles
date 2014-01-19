export EDITOR='vim'
export LESS="-R --quit-if-one-screen -X"
# project folder that we can `c [tab]` to
export PROJECTS=~/Code

if which zsh >/dev/null
then
    export SHELL=$(which zsh)
fi

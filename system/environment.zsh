export EDITOR='vim'
export LESS="-R --quit-if-one-screen -X"

if which zsh >/dev/null
then
    export SHELL=$(which zsh)
fi

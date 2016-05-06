source $HOME/.dotfiles/zgen/zgen.zsh

if ! zgen saved; then

    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/jump
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh themes/lambda

    zgen load  zsh-users/zsh-syntax-highlighting

    zgen save
fi

autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"


export EDITOR='vim'

alias c="cd"
alias m="mark"
alias j="jump"

alias tn="tmux new -s"

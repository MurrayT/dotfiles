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
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export MOAI_BIN="$HOME/Programming/lua/moaisdk-osx-1/bin/osx/"
export PATH="$PATH:$MOAI_BIN"
export DYLOD_LIBRARY_PATH="/opr/X11/lib"

alias c="cd"
alias m="mark"
alias j="jump"

alias tn="tmux new -s"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"

# OPAM configuration
. /Users/murraytannock/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#chruby, gem_home
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/share/gem_home/gem_home.sh
unsetopt auto_pushd
unsetopt pushd_ignore_dups
source ~/perl5/perlbrew/etc/bashrc

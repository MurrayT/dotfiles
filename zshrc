# Created by newuser for 5.3.1
#
setopt correctall
setopt extendedglob
unsetopt CASE_GLOB
autoload -U +X compinit && compinit
setopt menu_complete
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# zstyle ':completion:*:warnings' format '%BSorry, not matches for :%d%b'
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

autoload -U promptinit && promptinit
# EDITOR
export EDITOR='vim'
bindkey -e
export LESS='-XgmR'

export LANG=en_NZ.UTF-8

# DYLOD PATH for X11
export DYLOD_LIBRARY_PATH="/opt/X11/lib"

# ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# Path management
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/repos/zsh-git-prompt/src/.bin"

# Chruby and gem_home
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/share/gem_home/gem_home.sh

# ALIASES

alias tn="tmux new -s"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"

# History
export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE="$HOME/.zsh_history"
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey '\e[3~' delete-char


# PROMPT
GIT_PROMPT_EXECUTABLE="haskell"
source $HOME/repos/zsh-git-prompt/zshrc.sh
# an example prompt
PROMPT='%B%n:%2~%b$(git_super_status) %# '

#Perlbrew
source ~/perl5/perlbrew/etc/bashrc

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# zsh highlighting
source $HOME/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`

# Luarocks
eval `luarocks path`

# Postgres
export PGDATA="/usr/local/var/postgres"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Jenv
eval "$(jenv init -)"

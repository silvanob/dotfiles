# --- completion ---
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# --- history ---
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS SHARE_HISTORY

# --- plugins ---
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^F' autosuggest-accept

# --- prompt ---
eval "$(starship init zsh)"

# --- fuzzy finder ---
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# --- locale / misc ---
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
export BROWSER=w3m

# --- languages ---
export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
export GOPATH="$HOME/go"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:$GOPATH/bin:$HOME/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && source "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && source "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"

command -v pyenv &>/dev/null && eval "$(pyenv init -)"

# --- colors ---
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# --- aliases ---
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias zshconfig='nvim ~/.zshrc'
alias nvimconfig='nvim ~/.config/nvim'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ks='tmux kill-server'

command -v fastfetch &>/dev/null && fastfetch

alias vim="nvim"
alias vi="nvim"
alias vinit=viminit
alias viminit="nvim ~/.config/nvim/init.vim"
alias git="LD_PRELOAD=/usr/local/bin/gitbslr.so git"
alias udot="cd ~/dotfiles && git add . && git commit -m 'update files' && git push origin master && cd -"
alias zshalias="vim $ZSH_CUSTOM/aliases.zsh"
export GPG_TTY=$(tty)

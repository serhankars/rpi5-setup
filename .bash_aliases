# ~/.config/fish/functions/abbr.fish

alias :q=exit
alias cat=batcat
alias z=cd
alias curl=/usr/local/opt/curl/bin/curl
alias d='git diff --color-moved'
alias g=git
alias grep='grep --color=auto'
alias k=kubectl
alias l='exa --long --all --git'
alias ll='ls -GAhltr'
alias m=make
alias n=fzf\ --preview\ \'bat\ --style=numbers\ --color=always\ --line-range\ :500\ \{\}
alias p='git push'
alias pu='git pull'
alias s='git status'
alias stat='stat -x'
alias tree='tree -C'
alias vi=nvim
alias wget='wget -c'
alias howto=tldr
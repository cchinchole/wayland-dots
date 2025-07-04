#(cat ~/.cache/wal/sequences &)
autoload -U colors && colors

# Environment Variables
export XDG_CONFIG_HOME=~/.config
export GOPATH="$HOME/opt/modules/go"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/opt/cross/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:$HOME/scripts"

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

#Plugins for suggestion and syntax highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Auto Completion
autoload -Uz compinit
compinit

#Highlighting color
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=magenta,bold'

#Aliases
alias ll='ls -al --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

PROMPT="[%n@%{$fg[red]%}%m%{$fg[yellow]%} %~%{$fg[white]%}]%#"

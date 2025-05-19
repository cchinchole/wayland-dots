#(cat ~/.cache/wal/sequences &)
autoload -U colors && colors


# Environment Variables
export XDG_CONFIG_HOME=~/.config
export PATH="$PATH:/home/kafka/opt/cross/bin"
export PATH="$PATH:/home/kafka/.local/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:$HOME/scripts"
. ~/.local/lib/python/bin/activate
#export PATH="$PATH:$HOME/.local/lib/python/bin/activate"

#OhMyPosh Prompt
#eval "kitty @ set-colors -c $HOME/base16-kitty/colors/$(cat $XDG_CONFIG_HOME/.base16_theme).conf"
#eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/myconf.json')"
#Macchiato eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/catpuccin_macchiato.json')"
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/catpuccin_mocha.json')"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

#Load completion
autoload -Uz compinit
compinit

#Plugins for suggestion and syntax highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Highlighting color
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=magenta,bold'

#fastfetch

#Aliases
#command -v colorls > /dev/null && alias ls='colorls --sd --gs'
alias ll='ls -al'

# bun completions
[ -s "/home/kafka/.bun/_bun" ] && source "/home/kafka/.bun/_bun"

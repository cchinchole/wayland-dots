#(cat ~/.cache/wal/sequences &)
autoload -U colors && colors


# Environment Variables
export XDG_CONFIG_HOME=~/.config
export PATH="$PATH:/home/christian/.local/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

eval "kitty @ set-colors -c $HOME/base16-kitty/colors/$(cat $XDG_CONFIG_HOME/.base16_theme).conf"
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/myconf.json')"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

autoload -Uz compinit
compinit

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=magenta,bold'

fastfetch

#Aliases
#command -v colorls > /dev/null && alias ls='colorls --sd --gs'

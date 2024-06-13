(cat ~/.cache/wal/sequences &)
autoload -U colors && colors

git_prompt() {
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)"
    local branch_truncated="${branch:0:30}"

    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi

    [ -n "${branch}" ] && echo "${branch}"
}

# get the name of the branch we are on
_git_repo_name() { 
    gittopdir=$(git rev-parse --git-dir 2> /dev/null)
    if [[ "foo$gittopdir" == "foo.git" ]]; then
        echo `basename $(pwd)`
    elif [[ "foo$gittopdir" != "foo" ]]; then
        echo `dirname $gittopdir | xargs basename`
    fi
}



#setopt PROMPT_SUBST

setopt PROMPT_SUBST
#PROMPT='%F{magenta}[ %B%{$fg[red]%}%n %{$fg[blue]%}%~%{$fg[yellow]%} $(_git_repo_name)$(git_prompt) %F{magenta}] %{$reset_color%}%(?.$.%{$fg[red]%}$)%b '
PROMPT='%F{magenta}[ %B%{$fg[red]%}%n@$HOST   %{$fg[blue]%}%~%{$fg[yellow]%} $(git_prompt) %F{magenta}] %{$reset_color%}%(?.$.%{$fg[red]%}$)%b '

#PS1="%F{red}[ %F{red}$USER %F{magenta}%~  %F{yellow}{ ${git_branch_name} } %F{red}]$ " 

# Lines configured by zsh-newuser-install



HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/Christian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#
#neofetch
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
#source /usr/share//zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=magenta,bold'

pfetch

# Created by `pipx` on 2024-06-08 10:49:39
export PATH="$PATH:/home/christian/.local/bin"
alias config='/usr/bin/git --git-dir=/home/christian/.cfg/ --work-tree=/home/christian'

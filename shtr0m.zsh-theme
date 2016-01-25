autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}%b%{$fg[yellow]%} %m%{$fg[red]%}%u%{$fg[green]%}%c%{$reset_color%} "
zstyle ':vcs_info:git*' actionformats "%{$fg[blue]%}%b%{$fg[yellow]%} (%a) %m%{$fg[red]%}%u%{$fg[green]%}%c%{$reset_color%} "
PS1='┌─[%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$fg_bold[green]%} %~ %{$fg_no_bold[red]%}%(0?..%?)%{$reset_color%}] %{$vcs_info_msg_0_%}
└─╼ '
RPROMPT='%{$fg[yellow]%}[%*]%{$reset_color%}'

zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        echo -ne "\033]12;#85678F\007"
    else
        echo -ne "\033]12;#8C9440\007"
    fi
};
zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    echo -ne "\033]12;#8C9440\007"
};
zle -N zle-line-init

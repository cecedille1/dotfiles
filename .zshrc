# p
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt auto_pushd notify correct appendhistory no_glob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cecedille1/.zshrc'

autoload -U colors
colors

autoload -Uz compinit
compinit

autoload -U zfinit
zfinit

autoload -U zcalc

# End of lines added by compinstall

#export PS1='%m:%~%% '
export PS1="$(print '%{\e[1;33m%}%m%{\e[0m%}'):$(print '%{\e[1;38m%}%~%{\e[0m%}')%# "
export RPS1="$(print '%{\e[1;36m%}%T%{\e[0m%}')"
export EDITOR="vim"

alias grep='grep --color'
alias nl='nl -ba'
alias ls='ls --color'
alias ll='ls --color -l'
alias la='ls --color -la'
alias maek='make'
alias dc='cd'
alias sl='ls'
alias sduo='sudo'
alias sudi='sudo'
alias suod='sudo'
alias pwdx='python -c "import sys, os; sys.stdout.write(os.getcwd())" | xclip -i'
alias cdx='cd $(xclip -o)'
alias xclip_pc='xclip -o -selection primary | xclip -i -selection clipboard'
alias xclip_cp='xclip -o -selection clipboard | xclip -i -selection primary'
alias dkr='docker compose run --rm -u "$(id -u)"'


alias jsonize='python -m json.tool | python -m pygments.cmdline -l javascript'


function spellcheck {
typeset y=$@
curl -sd "<spellrequest><text>$y</text></spellrequest>" 'https://www.google.com/tbproxy/spell?lang=fr' |sed -n '/s="[0-9]"/{s/<[^>]*>/ /g;s/\t/ /g;s/ *\(.*\)/Suggestions: \1\n/g;p}'|tee >(grep -Eq '.*'||echo -e "OK")
}

chpwd() {
    test -d $PWD/.git && ~/workspace/term-bg-color $PWD
}

precmd() {
    echo -en "\033]0;urxvt [$PWD]\007"
}
preexec() {
    echo -en "\033]0;urxvt [$PWD] $1\007"
}
emansible_() {
    playbook=$1
    shift
    ANSIBLE_ROLES_PATH=$(pwd)/deployment/roles/:${ANSIBLE_ROLES_PATH} ~/enix/Emencia/Emansible/v1/ansible-playbook ~/enix/Emencia/Emansible/$playbook.yml $@
}

alias ssh-over-socks='ssh -o ProxyCommand="nc -x 127.0.0.1:9006 %h %p"'

bindkey '^[[3~' delete-char
bindkey '^[[2~' overwrite-mode
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

alias sbg=~/workspace/term-bg-color
alias rbg='~/workspace/term-bg-color -r'
source ~/.zsh.d/z/z.sh
alias tfq='~/workspace/term-bg-color tfq; test -f /tmp/q || touch /tmp/q; tail -f /tmp/q'
alias rg='rg -S --type-add "robot:*.robot"'

export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
export PICTURES=/home/cecedille1/Images/screens/

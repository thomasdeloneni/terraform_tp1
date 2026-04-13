# ~/.bashrc
# Fichier copié depuis /etc/skel pour les nouveaux utilisateurs

case $- in
    *i*) ;;
      *) return;;
esac

HISTSIZE=2000
HISTFILESIZE=4000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
shopt -s checkwinsize

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias tf='terraform'

export AWS_PAGER=""
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
mkdir -p "$TF_PLUGIN_CACHE_DIR"

# Couleurs ANSI réelles
C_RESET=$'\e[0m'
C_USER=$'\e[1;32m'
C_HOST=$'\e[1;34m'
C_PATH=$'\e[1;33m'
C_GIT=$'\e[1;35m'
C_SYMBOL=$'\e[1;36m'

parse_git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
    branch=$(git rev-parse --short HEAD 2>/dev/null) || \
    return
    printf ' (%s)' "$branch"
}

PS1='\['"$C_USER"'\]\u\['"$C_RESET"'\]@\['"$C_HOST"'\]\h\['"$C_RESET"'\]:\['"$C_PATH"'\]\w\['"$C_GIT"'\]$(parse_git_branch)\['"$C_RESET"'\] \['"$C_SYMBOL"'\]\$\['"$C_RESET"'\] '

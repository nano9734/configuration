# Alias
alias vi='sudo -E vi'
alias py='python3 -m'
alias .='sudo -E vi .'

# activate virus environment in Python
alias venv='source .venv/bin/activate'

# Trying to be Windows ?
alias cls='clear'
_menu_complete_files_only() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(compgen -f -- "$cur"))
}

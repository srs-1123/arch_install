#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

case ${TERM} in
  Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')

    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
esac

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

eval "$(starship init zsh)"

alias ttyclock='tty-clock -c -C 4'
alias tty-clock='tty-clock -c -C 4'
alias clock='tty-clock -c -C 4'
alias cmatrix='cmatrix -C blue'
alias matrix='cmatrix'
alias emacs='emacs -nw'
alias shutdown='shutdown now'

neofetch


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/srs1123/.opam/opam-init/init.zsh' ]] || source '/home/srs1123/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
export PATH="$PATH":"/home/srs1123/.opam/default/bin"

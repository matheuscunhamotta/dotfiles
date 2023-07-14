# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# User settings bellow.

# Change to projects directory.
alias c='cd ~/code'

# Quick back.
alias ..='cd ..'

# -lAhv: long listing; exclude . and ..; human-readable sizes; natural sort.
alias l='ls -lAhv --group-directories-first'

# Debian renamed bat to batcat.
bat_command=$(command -v batcat || command -v bat)
if [[ -x "$bat_command" ]]; then
    alias bat=batcat && alias cat=bat
fi

# Debian renamed fd to fdfind.
fd_command=$(command -v fdfind || command -v fd)
if [[ -x "$fd_command" ]]; then
    alias fd=fdfind
fi

# Configure fzf to work with bat and fd when possible.
if command -v fzf &> /dev/null; then
    if [[ -x "$fd_command" ]]; then
        # Configure fzf to use fd instead of find. See:
        # https://github.com/junegunn/fzf#respecting-gitignore
        export FZF_DEFAULT_COMMAND="${fd_command} --type f --strip-cwd-prefix --hidden --follow --exclude .git"
    fi

    if [[  -x "$bat_command" ]]; then
        # Configure fzf to show a preview window using bat, despite the
        # recommendation not to: https://github.com/junegunn/fzf#preview-window
        export FZF_DEFAULT_OPTS="--preview='${bat_command} --style=numbers --color=always --line-range :200 {}'"
    fi
fi

# Use bat as man pager.
if [[ -x "$bat_command" ]]; then
    export MANPAGER="sh -c 'col -bx | ${bat_command} -l man -p'"
fi

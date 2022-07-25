# Description of short options:
# -l: use a long listing format
# -A: list everything except . and .. directories
# -h: human-readable sizes
# -v: natural sort (.dotfiles first, then by name, etc)
alias l='ls -lAhv --group-directories-first --color=auto'

# Debian renamed bat to batcat.
type batcat >/dev/null 2>&1 && alias cat=batcat


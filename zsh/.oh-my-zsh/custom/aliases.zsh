# Description of ls options:
# -l: use a long listing format
# -A: list everything except . and .. directories
# -h: human-readable sizes
# -v: natural sort (.dotfiles first, then by name, etc)
alias l='ls -lAhv --group-directories-first --color=auto'

# Debian renamed bat to batcat.
type batcat >/dev/null 2>&1 && alias cat=batcat

# Change to projects directory.
alias c='cd ~/code/'

# Fix tmux color issue. Disabled since we fixed it in .tmux.conf.
#alias tmux='TERM=screen-256color-bce tmux'


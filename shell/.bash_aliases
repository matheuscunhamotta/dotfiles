# Quick back.
alias ..='cd ..'

# -lAhv: long listing; exclude . and ..; human-readable sizes; natural sort.
alias l='ls -lAhv --group-directories-first'

# Debian renamed bat to batcat.
type batcat >/dev/null 2>&1 && alias cat=batcat && alias bat=batcat

# Debian renamed fd to fdfind.
type fdfind >/dev/null 2>&1 && alias fd=fdfind

# Change to projects directory.
alias c='cd ~/code/'

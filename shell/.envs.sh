# Set PATH so it includes user's private bin if it exists.
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Set PATH so it includes user's private .local bin if it exists.
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Configure fzf to use fd instead of find.  See:
# https://github.com/junegunn/fzf#respecting-gitignore
type fzf >/dev/null 2>&1 && type fdfind >/dev/null 2>&1 && export \
    FZF_DEFAULT_COMMAND="fdfind --type f"

# Configure fzf to show a preview window using bat.
type fzf >/dev/null 2>&1 && type batcat >/dev/null 2>&1 && export \
    FZF_DEFAULT_OPTS="--preview='batcat --style=numbers --color=always --line-range :200 {}'"

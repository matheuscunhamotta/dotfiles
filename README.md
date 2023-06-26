## Instructions

Stow packages with:

```shell
stow -t ~ <package name>
```

If stow refuses to create the symlinks because of conflicts, then do this:

- `git stash -u` # [Optional] Stash working directory changes, if any.
- `stow --adopt -t ~ <package name>` # Adopt upstream files.
- `git restore .` # Restore local files.
- `stow -t ~ <package name>` # Try to stow again.
- `git stash pop` # [Optional] restore stashed changes.

## License

MIT License. Or whatever.

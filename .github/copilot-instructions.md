# Copilot Instructions for AI Coding Agents

## Project Overview
This repository manages personal dotfiles using GNU Stow for symlink management. Each subdirectory (e.g., `vim/`, `tmux/`, `shell/`, `ssh/`, `vscode/`, `git/`) represents a stow package containing configuration files for a specific tool or environment.

## Key Workflows
- **Stowing a package:**
  ```sh
  stow -t ~ <package name>
  ```
- **Resolving stow conflicts:**
  1. `git stash -u` (optional, stash local changes)
  2. `stow --adopt -t ~ <package name>` (adopt existing files)
  3. `git restore .` (restore repo state)
  4. `stow -t ~ <package name>` (retry stow)
  5. `git stash pop` (optional, restore stashed changes)

## Project Structure
- Each top-level directory (except `.github/`, `LICENSE`, `README.md`) is a stow package.
- Place new config files in the appropriate package directory.
- Avoid duplicating config files across packages.

## Conventions & Patterns
- Do **not** commit secrets or machine-specific settings.
- Use relative symlinks where possible (GNU Stow default).
- Keep package directories flat; avoid deep nesting unless required by the target application.
- Document any non-obvious config customizations in the relevant package's README or as comments in the config file.

## Examples
- To add a new Vim plugin, place its config in `vim/` and restow: `stow -t ~ vim`
- To update tmux settings, edit files in `tmux/` and restow: `stow -t ~ tmux`

## Reference
- See the main `README.md` for stow/adopt workflow details.
- For new tools, create a new package directory and follow the same stow pattern.

---
For questions or unclear conventions, review the main `README.md` or ask for clarification.

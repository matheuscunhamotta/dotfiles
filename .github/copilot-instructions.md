
# Copilot Instructions for AI Coding Agents

## Project Overview
This repository manages personal dotfiles and system setup using a structured approach:

- **`stow/`**: Contains all stow packages (e.g., `git/`, `shell/`, `tmux/`, `vim/`, `vscode/`, `ssh/`). Each subdirectory is a package of config files for a specific tool. Symlinks are managed with GNU Stow.
- **`ansible/`**: Contains Ansible playbooks, roles, and inventory for system provisioning and automation.
- **`scripts/`**: Contains helper scripts, notably `bootstrap.sh` for initial setup.
- **Top-level files**: `LICENSE`, `README.md`, `.github/`.

## Key Workflows
- **Bootstrap everything:**
  ```sh
  ./scripts/bootstrap.sh
  ```
  - Installs stow if needed, stows all packages from `stow/`, and (optionally) runs Ansible.
- **Stow a single package:**
  ```sh
  stow -d stow -t ~ <package>
  ```
- **Resolve stow conflicts:**
  1. `git stash -u` (optional)
  2. `stow --adopt -d stow -t ~ <package>`
  3. `git restore .`
  4. `stow -d stow -t ~ <package>`
  5. `git stash pop` (optional)
- **Provision with Ansible:**
  ```sh
  ansible-playbook ansible/playbook.yml
  ```

## Project Structure & Conventions
- All config packages live under `stow/` (not top-level).
- Do **not** commit secrets or machine-specific settings.
- Use relative symlinks (GNU Stow default).
- Keep package directories flat unless required by the target application.
- Document non-obvious customizations in package README or config comments.

## Examples
- Add a new Vim config: place in `stow/vim/` and restow: `stow -d stow -t ~ vim`
- Add a new Ansible role: place in `ansible/roles/` and reference in `playbook.yml`
- Add a new bootstrap step: edit `scripts/bootstrap.sh`

## Reference
- See `README.md` for stow/adopt workflow details.
- For new tools, create a new package under `stow/` and follow the same pattern.
- For system automation, use `ansible/`.

---
For questions or unclear conventions, review the main `README.md` or ask for clarification.

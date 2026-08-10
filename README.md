## Setup Instructions

You can either run the default setup automatically with the bootstrap script, or follow the manual steps below.

### Option 1: Use the bootstrap script (recommended)

```sh
./scripts/bootstrap.sh
```

This will:
- Ensure Ansible is installed
- Run the Ansible playbook to install core CLI tools (`stow`, `git`, `neovim`, `tmux`, `fzf`, `ripgrep`, `fd`, `bat`, `podman`, `jq`, `vim`)
- Stow all packages into `$HOME`, resolving conflicts automatically

### Option 2: Manual setup

1. **Run the default Ansible playbook (core packages only):**
	```sh
	ansible-playbook ansible/playbook.yml -K
	```

2. **Optional: Install additional tools using Targeted Tags:**
   The playbook uses Ansible `never` tags to keep optional developer tools modular. You can run targeted installs for specific tools:

   * **GitHub CLI (`gh`)**:
     ```sh
     ansible-playbook ansible/playbook.yml --tags gh -K
     ```
   * **Docker Suite** (`docker-ce`, `docker-compose-plugin`, etc.):
     ```sh
     ansible-playbook ansible/playbook.yml --tags docker -K
     ```
   * **Terraform**:
     ```sh
     ansible-playbook ansible/playbook.yml --tags terraform -K
     ```
   * **Google Cloud CLI**:
     ```sh
     ansible-playbook ansible/playbook.yml --tags gcloud -K
     ```
   * **All Extra Developer Tools** (Terraform, GCloud, GitHub CLI):
     ```sh
     ansible-playbook ansible/playbook.yml --tags extra -K
     ```

3. **Stow packages:**
	```sh
	stow -d stow -t ~ <package name>
	```
	- Example: `stow -d stow -t ~ vim`

4. **If stow refuses to create symlinks due to conflicts:**
	- `git stash -u` # [Optional] Stash working directory changes, if any.
	- `stow --adopt -d stow -t ~ <package name>` # Adopt upstream files.
	- `git restore .` # Restore local files.
	- `stow -d stow -t ~ <package name>` # Try to stow again.
	- `git stash pop` # [Optional] Restore stashed changes.

## License

MIT License.

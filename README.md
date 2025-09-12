
## Setup Instructions

1. **Run the Ansible playbook to install required packages:**

	```sh
	ansible-playbook ansible/playbook.yml
	```

	- This will install all necessary tools for either Debian/Ubuntu or Fedora.

2. **Stow packages:**

	```sh
	stow -d stow -t ~ <package name>
	```

	- Example: `stow -d stow -t ~ vim`

3. **If stow refuses to create the symlinks because of conflicts:**

	- `git stash -u` # [Optional] Stash working directory changes, if any.
	- `stow --adopt -d stow -t ~ <package name>` # Adopt upstream files.
	- `git restore .` # Restore local files.
	- `stow -d stow -t ~ <package name>` # Try to stow again.
	- `git stash pop` # [Optional] restore stashed changes.

## License

MIT License. Or whatever.

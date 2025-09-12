#!/usr/bin/env bash
# Bootstrap script for setting up dotfiles and system
set -e


# Check for ansible, install if missing
if ! command -v ansible >/dev/null 2>&1; then
  echo "Ansible not found. Installing..."
  if [ -f /etc/debian_version ]; then
    sudo apt-get update && sudo apt-get install -y ansible
  elif [ -f /etc/fedora-release ] || [ -f /etc/redhat-release ]; then
    sudo dnf install -y ansible
  else
    echo "Unsupported OS. Please install Ansible manually."
    exit 1
  fi
fi

# Run ansible playbook
echo "Running Ansible playbook..."
ansible-playbook ansible/playbook.yml

# Stow dotfiles
echo "Installing stow packages..."

for pkg in stow/*; do
  if [ -d "$pkg" ]; then
    pkgname="$(basename "$pkg")"
    if ! stow -d stow -t "$HOME" "$pkgname" 2>/dev/null; then
      echo "Conflict detected for package $pkgname. Following README conflict resolution steps..."
      git stash -u
      stow --adopt -d stow -t "$HOME" "$pkgname"
      git restore .
      stow -d stow -t "$HOME" "$pkgname"
      git stash pop || true
    fi
  fi
done

echo "Bootstrap complete."

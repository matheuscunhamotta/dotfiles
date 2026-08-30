#!/usr/bin/env bash
# Bootstrap script for setting up dotfiles and system
set -e

SUDO="sudo"
[ "$(id -u)" = "0" ] && SUDO=""

# Check for ansible, install if missing
if ! command -v ansible >/dev/null 2>&1; then
  echo "Ansible not found. Installing..."
  if [ -f /etc/debian_version ]; then
    $SUDO apt-get update && $SUDO apt-get install -y ansible python3-apt
  elif [ -f /etc/fedora-release ] || [ -f /etc/redhat-release ]; then
    $SUDO dnf install -y ansible
  else
    echo "Unsupported OS. Please install Ansible manually."
    exit 1
  fi
fi

# Run ansible playbook
echo "Running Ansible playbook..."
EXTRA_ARGS=()
if [ "$(id -u)" = "0" ]; then
  EXTRA_ARGS+=(-e ansible_become=false)
elif sudo -n true 2>/dev/null; then
  : # passwordless sudo already available, no need to prompt
else
  EXTRA_ARGS+=(-K)
fi
ansible-playbook ansible/playbook.yml "${EXTRA_ARGS[@]}"

# Stow dotfiles
echo "Installing stow packages..."

for pkg in stow/*; do
  if [ -d "$pkg" ]; then
    pkgname="$(basename "$pkg")"
    if ! stow --no-folding -d stow -t "$HOME" "$pkgname" 2>/dev/null; then
      echo "Conflict detected for package $pkgname. Following README conflict resolution steps..."
      git stash -u
      stow --adopt --no-folding -d stow -t "$HOME" "$pkgname"
      git restore .
      stow --no-folding -d stow -t "$HOME" "$pkgname"
      git stash pop || true
    fi
  fi
done

echo "Bootstrap complete."

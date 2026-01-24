#!/bin/bash

# packages that i personally want installed if I am setting up another machine.

set -e

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
AUR_LIST="$DOTFILES_DIR/packages/pkglist-aur.txt"
PACMAN_LIST="$DOTFILES_DIR/packages/pkglist-pacman.txt"

echo "installing needed pacman packages"
sudo pacman -S --needed - <"$PACMAN_LIST"

if command -v yay &>/dev/null; then
  echo "installing aur packages"
  yay -S --needed - <"$AUR_LIST"
else
  read -rp "would you like to install the AUR? (Y/n):" input
  if [[ -z "$input" || "$input" == "Y" || "$input" == "y" ]]; then
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    cd "$tmpdir/yay"
    makepkg -si
    if command -v yay &>/dev/null; then
      echo "installing aur packages"
      yay -S --needed - <"$AUR_LIST"
    else
      echo "aur failed to install skipping aur packages"
    fi
  else
    echo "yay not installed, skipping aur packages"
    echo "aur packages can be found at /packages/pkglist-aur.txt"
  fi
fi

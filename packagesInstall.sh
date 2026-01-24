#!/bin/bash

# packages that i personally want installed if I am setting up another machine.

set -e

echo "installing needed pacman packages"
sudo pacman -S --needed - <packages/pkglist-pacman.txt

if command -v yay &>/dev/null; then
  echo "installing aur packages"
  yay -S --needed - <packages/pkglist-aur.txt
else
  read -rp "would you like to install the AUR? (Y/n):" input
  if [[ -z "$input" || $input" == "Y" || "$input" == "y" ]]; then
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    cd "$tmpdir/yay"
    makepkg -si
    if command -v yay &>/dev/null; then
      echo "installing aur packages"
      yay -S --needed - <packages/pkglist-aur.txt
    else
      echo "aur failed to install skipping aur packages"
    fi
  else
    echo "yay not installed, skipping aur packages"
    echo "aur packages can be found at /packages/pkglist-aur.txt"
  fi
fi

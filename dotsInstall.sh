#!/bin/bash

# setup script for ryna dotfiles.

set -e

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DST="$HOME/.config"

mkdir -p "$CONFIG_DST"

echo "please ensure that all needed packages are installed."
read -rp "confirm that packages are installed (Y/n): " input

if [[ -z "$input" || "$input" == "Y" || "$input" == "y" ]]; then
  echo "symlinking files into ~/.config"
  for src in "$DOTFILES_DIR"/*/; do
    [[ -d "$src" ]] || continue

    name="$(basename "$src")"
    [[ "$name" == "packages" ]] && continue
    [[ "$name" == ".git" ]] && continue
    [[ "$name" == "wallpapers" ]] && continue

    dst="$CONFIG_DST/$name"

    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
      echo "OK: $dst already linked"
      continue
    fi

    echo "LINK: $dst -> $src"
    ln -s "$src" "$dst"
  done

else
  echo "failed to symlink files. quitting script"
fi

#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Files to symlink: "source:target" (paths relative to DOTFILES_DIR → relative to $HOME)
FILES=(
  "zsh/.zshrc:.zshrc"
  "zsh/.zprofile:.zprofile"
  "git/.gitconfig:.gitconfig"
  "tmux/.tmux.conf:.tmux.conf"
  "nano/.nanorc:.nanorc"
  "mc/.config/mc/ini:.config/mc/ini"
)

backup_and_link() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "  Backing up $target → $BACKUP_DIR/"
    mv "$target" "$BACKUP_DIR/"
  elif [ -L "$target" ]; then
    rm "$target"
  fi

  ln -s "$source" "$target"
  echo "  Linked $target → $source"
}

echo "Installing dotfiles from $DOTFILES_DIR"
echo ""

for entry in "${FILES[@]}"; do
  source_rel="${entry%%:*}"
  target_rel="${entry##*:}"

  source_abs="$DOTFILES_DIR/$source_rel"
  target_abs="$HOME/$target_rel"

  if [ ! -f "$source_abs" ]; then
    echo "  Skipping $source_rel (not found)"
    continue
  fi

  # Ensure target parent directory exists
  mkdir -p "$(dirname "$target_abs")"
  backup_and_link "$source_abs" "$target_abs"
done

echo ""
echo "Done! Backups (if any) saved to $BACKUP_DIR"

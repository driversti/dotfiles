# Dotfiles

Personal configuration files for Linux servers.

## What's included

- **zsh** — Oh My Zsh with plugins (syntax highlighting, autosuggestions, history search)
- **git** — user config
- **tmux** — C-a prefix, intuitive splits, mouse support
- **nano** — line numbers, syntax highlighting, tabs-to-spaces
- **mc** — Midnight Commander with arrow navigation, dark skin

## Usage

Clone the repo on a server and run the install script:

```bash
git clone https://github.com/driversti/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
./install.sh
```

This creates symlinks from `$HOME` to the repo files (e.g. `~/.zshrc → ~/Projects/dotfiles/zsh/.zshrc`). If a file already exists, it gets backed up to `~/.dotfiles_backup/`.

To update configs later:

```bash
cd ~/Projects/dotfiles
git pull
```

Since everything is symlinked, updated files take effect immediately — no need to re-run `install.sh` unless new files were added.

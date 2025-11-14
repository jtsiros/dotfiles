# My Dotfiles 🏠

These are my personal dotfiles, managed with [chezmoi](https://chezmoi.io) for seamless cross-platform configuration. I use these daily on both Linux (AnduinOS) and macOS systems.

> **Note for others**: Feel free to use these as inspiration or a starting point for your own dotfiles! However, you'll likely want to customize paths, usernames, and personal preferences before using them directly.

## Quick Start

### For Me (jtsiros)
```bash
# Fresh install on a new machine
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jtsiros/dotfiles
```

### For Others Using These Dotfiles
```bash
# Fork this repo first, then:
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply YOUR_USERNAME/dotfiles
```

Or if you already have chezmoi:
```bash
chezmoi init --apply jtsiros/dotfiles  # or YOUR_USERNAME/dotfiles
```

## What You Get

### 🐚 Shell Environment
- **zsh** with custom configuration
- Modern command-line tools (fzf, fd, bat, eza)
- Cross-platform package management

### ⚡ Development Tools
- **Neovim** with comprehensive Lua configuration
- **Helix** editor setup
- **Doom Emacs** configuration
- **Git** with custom aliases and delta integration
- **tmux** with sensible defaults

### 🖥️ Terminal & UI
- **Ghostty** terminal configuration
- **Zed** editor settings
- **Zellij** terminal multiplexer
- Keyboard customizations (Karabiner on macOS)

### 🔧 System Tools
- **htop** configuration
- Cross-platform package installation scripts
- Odin Language Server (ols) setup for development

## Repository Structure

This repo uses a clean, organized template system:

```
.chezmoitemplates/     # All template logic (centralized)
dot_*                  # Clean dotfile references
CROSS_PLATFORM_SETUP.md   # Platform-specific notes
TEMPLATE_GUIDELINES.md     # How to add new templates
```

## Platform Support

- ✅ **Linux** (primary: AnduinOS, should work on most distros)
- ✅ **macOS** (Intel & Apple Silicon)
- 🔧 **Windows** (via WSL - untested but should work)

## Customization for Your Use

If you want to adapt these dotfiles:

1. **Fork this repository**
2. **Update personal info**:
   - Replace `/home/jtsiros` paths with your home directory
   - Update Git configuration with your details
   - Modify package lists in `.chezmoitemplates/install-packages.sh`
3. **Customize tools**: Remove or modify configurations for tools you don't use
4. **Test incrementally**: Use `chezmoi diff` before applying changes

See [TEMPLATE_GUIDELINES.md](TEMPLATE_GUIDELINES.md) for details on the organization system.

## Key Features

- 🏗️ **Build-time templating**: Platform detection happens during `chezmoi apply`
- 🎯 **Clean output**: Generated configs contain only relevant settings
- 📁 **Organized**: Template logic separated from file structure
- 🔄 **Idempotent**: Safe to run multiple times
- 📖 **Documented**: Clear guidelines for maintenance

## Daily Workflow

```bash
# Check what would change
chezmoi diff

# Apply any updates
chezmoi apply

# Edit a config file
chezmoi edit ~/.zshrc

# Add a new file to be managed
chezmoi add ~/.config/new-tool/config
```

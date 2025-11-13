#!/bin/bash

# Cross-platform package installer for chezmoi
# This script runs once and installs required packages based on the platform

set -e

echo "Installing packages for {{ .chezmoi.os }}..."

{{- if eq .chezmoi.os "darwin" }}
# macOS package installation via Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing packages via Homebrew..."
brew install \
    fzf \
    fd \
    bat \
    git-delta \
    eza \
    tldr \
    thefuck \
    tmux \
    tree-sitter \
    zellij \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    zoxide

echo "Installing GUI applications via cask..."
brew install --cask \
    ghostty \
    sf-symbols \
    font-meslo-lg-nerd-font \
    font-sf-pro \
    font-hack-nerd-font

{{- else }}
# Linux package installation
echo "Linux detected - running automated package installer..."

# Check if we have the Linux installer script
if [ -f "{{ .chezmoi.sourceDir }}/scripts/install-linux-packages.sh" ]; then
    "{{ .chezmoi.sourceDir }}/scripts/install-linux-packages.sh"
else
    echo "Linux package installer not found. Please install packages manually:"
    echo "fzf, fd-find/fd, bat, eza, git-delta, tldr, thefuck, tmux, helix, zellij, zsh-autosuggestions, zsh-syntax-highlighting, powerlevel10k, zoxide"
fi
{{- end }}

# Install Python development tools
echo "Installing Python development tools..."
if ! command -v uv &> /dev/null; then
    echo "Installing uv (Python package manager)..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

echo "Installing Python type checkers and formatters..."
npm install -g basedpyright

# Download additional tools
echo "Downloading additional tools..."
mkdir -p "$HOME/lib"

if ! curl -o "$HOME/lib/fzf-git.sh" https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh; then
    echo "Warning: Failed to download fzf-git.sh"
else
    chmod +x "$HOME/lib/fzf-git.sh"
    echo "Downloaded fzf-git.sh"
fi

echo "Package installation complete!"

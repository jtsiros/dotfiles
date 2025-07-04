#!/bin/bash

# Cross-platform package installer for dotfiles dependencies
# This script detects the Linux distribution and installs packages accordingly

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detect the distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
elif [ -f /etc/redhat-release ]; then
    DISTRO="rhel"
elif [ -f /etc/debian_version ]; then
    DISTRO="debian"
else
    DISTRO="unknown"
fi

print_status "Detected distribution: $DISTRO"

# Package lists for different distributions
declare -A PACKAGES

# Common packages that most distributions have
COMMON_PACKAGES="fzf fd-find bat git tmux tree-sitter curl wget"

# Distribution-specific package names
case $DISTRO in
    "ubuntu"|"debian"|"pop")
        PACKAGES=(
            ["fzf"]="fzf"
            ["fd"]="fd-find"
            ["bat"]="bat"
            ["eza"]="eza"
            ["git-delta"]="git-delta"
            ["tldr"]="tldr"
            ["tmux"]="tmux"
            ["zoxide"]="zoxide"
            ["zsh-autosuggestions"]="zsh-autosuggestions"
            ["zsh-syntax-highlighting"]="zsh-syntax-highlighting"
        )
        PACKAGE_MANAGER="apt"
        INSTALL_CMD="sudo apt update && sudo apt install -y"
        ;;
    "fedora"|"rhel"|"centos")
        PACKAGES=(
            ["fzf"]="fzf"
            ["fd"]="fd-find"
            ["bat"]="bat"
            ["eza"]="eza"
            ["git-delta"]="git-delta"
            ["tldr"]="tldr"
            ["tmux"]="tmux"
            ["zoxide"]="zoxide"
            ["zsh-autosuggestions"]="zsh-autosuggestions"
            ["zsh-syntax-highlighting"]="zsh-syntax-highlighting"
        )
        PACKAGE_MANAGER="dnf"
        INSTALL_CMD="sudo dnf install -y"
        ;;
    "arch"|"manjaro")
        PACKAGES=(
            ["fzf"]="fzf"
            ["fd"]="fd"
            ["bat"]="bat"
            ["eza"]="eza"
            ["git-delta"]="git-delta"
            ["tldr"]="tldr"
            ["tmux"]="tmux"
            ["zoxide"]="zoxide"
            ["zsh-autosuggestions"]="zsh-autosuggestions"
            ["zsh-syntax-highlighting"]="zsh-syntax-highlighting"
        )
        PACKAGE_MANAGER="pacman"
        INSTALL_CMD="sudo pacman -S --noconfirm"
        ;;
    *)
        print_error "Unsupported distribution: $DISTRO"
        print_status "Please install the following packages manually:"
        echo "fzf, fd-find/fd, bat, eza, git-delta, tldr, tmux, zoxide, zsh-autosuggestions, zsh-syntax-highlighting, powerlevel10k"
        exit 1
        ;;
esac

print_status "Using package manager: $PACKAGE_MANAGER"

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    INSTALL_CMD="${INSTALL_CMD/sudo /}"
fi

# Install packages
print_status "Installing packages..."

for package in "${!PACKAGES[@]}"; do
    package_name="${PACKAGES[$package]}"
    print_status "Installing $package ($package_name)..."
    
    if command -v "$package" &> /dev/null; then
        print_success "$package is already installed"
        continue
    fi
    
    if eval "$INSTALL_CMD $package_name"; then
        print_success "Successfully installed $package"
    else
        print_warning "Failed to install $package, you may need to install it manually"
    fi
done

# Install powerlevel10k
print_status "Installing Powerlevel10k..."
if [ ! -d "$HOME/.powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.powerlevel10k"
    print_success "Powerlevel10k installed to ~/.powerlevel10k"
else
    print_success "Powerlevel10k already installed"
fi

# Install thefuck
print_status "Installing thefuck..."
if command -v thefuck &> /dev/null || command -v fuck &> /dev/null; then
    print_success "thefuck is already installed"
elif command -v pip3 &> /dev/null; then
    if pip3 install --user thefuck; then
        print_success "thefuck installed via pip3"
    else
        print_warning "Failed to install thefuck via pip3 (may be due to externally managed Python environment)"
        print_status "You can install thefuck manually with: sudo apt install thefuck (if available) or pipx install thefuck"
    fi
elif command -v pip &> /dev/null; then
    if pip install --user thefuck; then
        print_success "thefuck installed via pip"
    else
        print_warning "Failed to install thefuck via pip (may be due to externally managed Python environment)"
        print_status "You can install thefuck manually with: sudo apt install thefuck (if available) or pipx install thefuck"
    fi
else
    print_warning "pip not found, please install thefuck manually: pip install thefuck or sudo apt install thefuck"
fi

print_success "Package installation complete!"
print_status "You may need to restart your shell or run 'source ~/.zshrc' to apply changes."

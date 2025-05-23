#!/bin/bash

# Install Vim, Tmux, and Fish Shell
echo "Installing Vim, Tmux, and Fish Shell..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y vim tmux fish fortune
elif command -v brew &> /dev/null; then
    brew install vim tmux fish fortune
elif command -v yum &> /dev/null; then
    sudo yum install -y vim-enhanced tmux fish fortune
else
    echo "Package manager not supported. Please install Vim, Tmux, and Fish manually."
    exit 1
fi

# Backup existing configuration files
echo "Backing up existing configuration files..."
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.backup
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.backup
[ -f ~/.config/fish/config.fish ] && mv ~/.config/fish/config.fish ~/.config/fish/config.fish.backup

# Create Fish config directory if it doesn't exist
mkdir -p ~/.config/fish

# Copy new configuration files
echo "Copying new configuration files..."
cat .vimrc > ~/.vimrc || { echo "Failed to copy vimrc"; exit 1; }
cat tmux.conf > ~/.tmux.conf || { echo "Failed to copy tmux.conf"; exit 1; }
cat config.fish > ~/.config/fish/config.fish || { echo "Failed to copy config.fish"; exit 1; }

# Set Fish as the default shell
if command -v fish &> /dev/null; then
    echo "Setting Fish as the default shell..."
    chsh -s "$(which fish)" || { echo "Failed to set Fish as default shell"; exit 1; }
else
    echo "Fish is not installed. Default shell not changed."
fi

# Reload Tmux configuration
echo "Reloading Tmux configuration..."
tmux source-file ~/.tmux.conf

# Notify user
echo "Setup complete! Enjoy your enhanced terminal experience! 🚀"

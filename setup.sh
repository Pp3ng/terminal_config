#!/bin/bash

# Install Vim, Tmux, and Fish Shell
echo "Installing Vim, Tmux, and Fish Shell..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y vim tmux fish
elif command -v brew &> /dev/null; then
    brew install vim tmux fish
elif command -v yum &> /dev/null; then
    sudo yum install -y vim-enhanced tmux fish
else
    echo "Package manager not supported. Please install Vim, Tmux, and Fish manually."
    exit 1
fi

# Backup existing configuration files
echo "Backing up existing configuration files..."
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.backup
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.backup
[ -f ~/.config/fish/config.fish ] && mv ~/.config/fish/config.fish ~/.config/fish/config.fish.backup

# Copy new configuration files
echo "Copying new configuration files..."
cp .vimrc ~/
cp .tmux.conf ~/
mkdir -p ~/.config/fish
cp config.fish ~/.config/fish/

# Reload Tmux configuration
echo "Reloading Tmux configuration..."
tmux source-file ~/.tmux.conf

# Notify user
echo "Setup complete! Enjoy your enhanced terminal experience! 🚀"
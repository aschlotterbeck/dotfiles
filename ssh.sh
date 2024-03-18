#!/bin/bash

# Initial script constructed in ChatGPT and then modified 

# Check if ~/.ssh folder exists. If not, create it.
if [ ! -d "$HOME/.ssh" ]; then
    mkdir -p "$HOME/.ssh"
    echo "Created ~/.ssh folder"
else
    echo "SSH folder already exists, continuing ..."
fi

# Symbolically linking authorized keys and config files
ln -sf ~/dotfiles/authorized_keys "$HOME/.ssh/authorized_keys"
ln -sf ~/dotfiles/config "$HOME/.ssh/config"
echo "Symbolically linked authorized keys and config files"



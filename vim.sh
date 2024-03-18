# Initial script constructed in ChatGPT and then modified

#!/bin/bash

# Install Vundle if not already installed
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
    echo "Vundle installed successfully"
else
    echo "Vundle is already installed"
fi

# Select and install a color scheme for Vim
echo "Selecting and installing a color scheme for Vim..."
# Replace "your_color_scheme" with the desired color scheme
echo "colorscheme koehler" > "$HOME/.vimrc"
echo "Color scheme installed successfully"


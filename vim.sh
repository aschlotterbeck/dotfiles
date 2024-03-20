# Initial script constructed in ChatGPT and then modified

#!/bin/bash

# Install Vundle if not already installed
if [ ! -d "/home/$ME/.vim/bundle/Vundle.vim" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git "/home/$ME/.vim/bundle/Vundle.vim"
    echo "Vundle installed successfully"
else
    echo "Vundle is already installed"
fi

# Select and install a color scheme for Vim
echo "Selecting and installing a color scheme for Vim..."
# Replace "your_color_scheme" with the desired color scheme
echo "colorscheme koehler" > "/home/$ME/.vimrc"
echo "Color scheme installed successfully"

# Install vim plugins then add improvement plugins
echo "Installing Plugins and then selecting a vim improvement"
ln -sf ~/dotfiles/vimrc "/$HOME/.vimrc"
echo "Replaced with repo vimrc"

vim +PluginInstall +qall
echo "Installed plugin list in vim"


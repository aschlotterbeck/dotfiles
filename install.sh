# Package installs from pattons girl dotfile
# Added nudoku game install and zip/unzip package installs

# get username that called script
echo $SUDO_USER
ME=$SUDO_USER

# check if effective user id is 0 (root)
if [[ "$(id -u)" -eq 0 ]]; then
	echo "Script is running as root"

	# check if apt is package manager
	# if apt is package manager and you run which apt it will specify a path to where its stored
	# install packages with apt
	echo $(which apt)
	if [[ -n "$(which apt)" ]]; then
		echo "apt is installed exactly as specified."
		apt install -y \
			nmap \
			dnsutils \
			libgl1-mesa-glx \
			libegl1-mesa \
			libxrandr2 \
			libxrandr2 \
			libxss1 \
			libxcursor1 \
			libxcomposite1 \
			libasound2 \
			libxi6 \
			libxtst6 \
			zip \
			unzip \
			nudoku
		if [[ -e $(ls Anaconda3*.sh 2> /dev/null | head -1) ]]; then
			echo "Installer found, running it"
		        bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/aschlotterbeck/anaconda3/bin" >> /home/$ME/.profile
	        else
	 		echo "Downloading anaconda installer"		
			curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
			bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/aschlotterbeck/anaconda3/bin" >> /home/$ME/.profile
		fi
	else
		echo "apt is not installed at the specified location."
	fi

	# git configurations

	# Referenced useful aliases links and Ultimate BA link from assignment for bash run commands	
	# Symbolic link for bash run commands
	ln -s /home/$ME/dotfiles/dotfiles/.bashrc /home/$ME/.bashrc
	# ln -s /home/$ME/dotfiles/.bashrc /home/$ME/.bashrc
	# ln -s ~/dotfiles/.bashrc ~/.bashrc

	# Initial script was constructed in ChatGPT and then modified
	# ssh public keys and authorized keys
	# Check if ~/.ssh folder exists. If not, create it.
	if [ ! -d "$HOME/.ssh" ]; then
    		mkdir -p "$HOME/.ssh"
    		echo "Created ~/.ssh folder"
	else
    		echo "SSH folder already exists, continuing ..."
	fi

	# Symbolically linking authorized keys and config files
	ln -s ~/dotfiles/authorized_keys "$HOME/.ssh/authorized_keys"
	ln -s ~/dotfiles/config "$HOME/.ssh/config"
	echo "Symbolically linked authorized keys and config files"

	# Initial script was constructed in ChatGPT and then modified
	# Vim customizations
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

else
	echo "Script is not running as root, exiting..." 1>&2
	exit 1
fi


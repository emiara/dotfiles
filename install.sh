#/usr/bin/env bash

pwd=$(pwd)
# Detecting OS
case "$(uname -s)" in
Linux*) OS=Linux ;;
Darwin*) OS=Mac ;;
*) echo "Unsupported OS: $OS" && exit 1 ;;
esac

packages="git stow tmux lazygit zsh lsd neovim fzf btop ripgrep"
install_oh_my_zsh() {
	if command -v zsh >/dev/null; then
		echo "Zsh is already installed"
		return
	fi
	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_rust() {
	if command -v rustup >/dev/null; then
		echo "Rust is already installed"
		return
	fi
	echo "Installing rust via rustup"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install_linux_packages() {
	if command -v apt >/dev/null; then
		sudo apt update && sudo apt install -y $packages
	elif command -v dnf >/dev/null; then
		sudo dnf install -y $packages
	elif command -v pacman >/dev/null; then
		sudo pacman -Syu --noconfirm $packages
	elif command -v zypper >/dev/null; then
		sudo zypper update -y
		sudo zypper install -y $packages
	else
		echo "Package manager not supported. Install packages manually."
		echo $packages
		exit 1
	fi
}

install_nvim_config() {
	if [ -d ~/.config/nvim ]; then
		echo "Neovim config already installed"
		return
	fi
	git clone git@github.com:emiara/nvim.git ~/.config/nvim/
}

install_mac_packages() {
	command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install $packages
}

while getopts "f" opt; do # f for fresh install
	echo "Installing packages"
	case $opt in
	f)
		case $OS in
		Linux) install_linux_packages ;;
		Mac) install_mac_packages ;;
		esac
		install_rust
		install_oh_my_zsh
		install_nvim_config
		;;
	\?)
		echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
	esac
done

# Git configuration
echo "Configuring git"
git config --global user.name "Emilio Aranda"
git config --global user.email "ara.emi44@gmail.com"
git config --global init.defaultBranch main
echo "Pulling latest changes from git"

git pull
echo "Updating submodules"
git submodule update --init --recursive

# Stow config files
for folder in $(ls -d */); do
	echo "Installing $folder"
	folder=${folder%/}
	stow -t ~ $folder
done

# To update and install tmux plugins: <leader> + U/I
echo "Sourcing tmux config"
tmux new-session -d -s temp
tmux source-file $pwd/tmux/.config/tmux/tmux.conf
tmux kill-session -t temp

# Launching lazygit
lazygit

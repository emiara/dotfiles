#/usr/bin/env bash

pwd=$(pwd)

# Detecting OS
case "$(uname -s)" in
Linux*) OS=Linux ;;
Darwin*) OS=Mac ;;
*) echo "Unsupported OS: $OS" && exit 1 ;;
esac

packages="git stow tmux lazygit zsh lsd neovim fzf btop "

install_linux_packages() {
  if command -v apt >/dev/null; then
    sudo apt update && sudo apt install -y $packages
  elif command -v dnf >/dev/null; then
    sudo dnf install -y git curl zsh tmux vim
  elif command -v pacman >/dev/null; then
    sudo pacman -Syu --noconfirm $packages
  elif command -v zypper >/dev/null; then
    sudo zypper update -y && sudo zypper upgrade -y
    sudo zypper install -y $packages
  else
    echo "Package manager not supported. Install packages manually."
    echo $packages
    exit 1
  fi
}

install_mac_packages() {
  command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install $packages
}

while getopts "f" opt; do # f for fresh install
    case $opt in
        f)
            case $OS in
            Linux) install_linux_packages;;
            Mac) install_linux_packages;;
            esac
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
tmux source-file $pwd/tmux/.config/tmux/tmux.conf

# Launching lazygit
lazygit

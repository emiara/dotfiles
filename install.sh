#!/bin/bash
#
# Check if in the correct directory
if [ ! -f .gitmodules ]; then
    echo ".gitmodules file not found. Please run this script from the root of your repository."
    exit 1
fi

# Initialize and update git submodules
echo "Initializing and updating git submodules..."
git submodule init
git submodule update --recursive --remote
echo "Submodules initialized and updated."

# Update the system and install necessary packages
echo "Updating system and installing necessary packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
    zsh \
    sway \
    swaync \
    waybar \
    alacritty \
    tmux \
    hyprland \
    stow \
    git \
    wget \
    curl \
    neovim \
    unzip \
    python-pip \
    wl-clipboard \
    ttf-font-awesome \
    noto-fonts-emoji \
    pavucontrol \
    pulseaudio \
    playerctl \
    wlroots \
    rofi \
    mako \
    grim \
    slurp \
    jq \
    starship \
    zoxide \
    rustup \
    eza

# Install swaync plugin (if not available through the main repository)
if ! pacman -Qi swaync &> /dev/null; then
    echo "Installing swaync from the AUR..."
    git clone https://aur.archlinux.org/swaync.git
    cd swaync
    makepkg -si --noconfirm
    cd ..
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "Oh My Zsh installed."
else
    echo "Oh My Zsh is already installed."
fi

# Stow the dotfiles into the home directory
echo "Stowing dotfiles..."

# Define directories for stow
directories=("zshrc" "swaync" "waybar" "hypr" "alacritty" "tmux")

for dir in "${directories[@]}"; do
    stow --target="$HOME" "$dir"
done

echo "Dotfiles stowed successfully."

# Set zsh as default shell
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing default shell to zsh..."
    chsh -s /usr/bin/zsh
fi

echo "Installation complete! Please reboot or log out and log back in."


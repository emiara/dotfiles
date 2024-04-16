#/usr/bin/env bash

pwd=$(pwd)

echo "Configuring git"
git config --global user.name "Emilio Aranda"
git config --global user.email "ara.emi44@gmail.com"
git config --global init.defaultBranch main
echo "Pulling latest changes from git"
git pull

echo "Updating submodules"
git submodule update --init --recursive

for folder in $(ls -d */);
do 
    echo "Installing $folder"
    folder=${folder%/}
    stow -t ~ $folder 
done

echo "Sourcing tmux config"
tmux source-file $pwd/tmux/.config/tmux/tmux.conf

# Launching lazygit
lazygit

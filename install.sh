#/usr/bin/env bash

pwd=$(pwd)
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

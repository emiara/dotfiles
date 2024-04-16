#/usr/bin/env bash

pwd=$(pwd)
echo "Pulling latest changes from git"
git pull

for folder in $(ls -d */);
do 
    echo "Installing $folder"
    folder=${folder%/}
    stow -t ~ $folder 
done

# Sourcing tmux config
echo "Sourcing tmux config"
tmux source-file $pwd/tmux/.config/tmux/tmux.conf

lazygit

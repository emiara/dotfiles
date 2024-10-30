#!/bin/bash

# Loop through all directories in the current folder
for dir in */ ; do
    # Use stow to symlink the folder contents to the home directory
    stow --target="$HOME" "$dir"
done

echo "Dotfiles have been successfully stowed to your home directory."


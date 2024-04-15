#/usr/bin/env bash

echo "Pulling latest changes from git"
git pull

for folder in $(ls -d */);
do 
    echo "Installing $folder"
    folder=${folder%/}
    stow -t ~ $folder 
done

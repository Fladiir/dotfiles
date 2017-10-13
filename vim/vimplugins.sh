#!/bin/bash

pathog="https://github.com/tpope/vim-pathogen"
vimpath=$HOME"/.vim/"


#Pathogen installation
cd  $vimpath
echo "Installing Pathogen"
echo "Downloading pathogen in $(pwd) ..."
git clone $pathog
sudo mv "/vim-pathogen/autoload/" $vimpath
sudo rm -r "vim-pathogen" #Clearing useless folders
echo "Done"

#Plugins installation
echo "Downloading plugins in $(pwd) ..."
cd bundle
for link in $(cat ./vimplug.txt); do
    git clone $link
    echo "Installing $link"
done



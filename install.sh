#!/bin/bash

set -x

dir=$HOME/dotfiles                    # dotfiles directory
olddir=$HOME/dotfiles_old             # old dotfiles backup directory
files="bash_aliases bash_functions bash_profile bashrc gitconfig inputrc\
 kdiff3rc minttyrc viminfo vimrc"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from $HOME to $olddir"
    mv $HOME/.$file $HOME/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $HOME/.$file
done


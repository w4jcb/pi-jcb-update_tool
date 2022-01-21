#!/usr/bin/env bash
############################
# This script creates symlinks from one directory to any desired location
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
	echo "Example install.sh /home/user_name"
    exit 1
fi

homedir=$1 #/home/user_name

# gitfiles directory
gitfiledir=${homedir}/Local-Repo/jcb-debian_update_tool

# list of files/folders to symlink in ${homedir}
files="jcb.sh"

# change to the gitfiles directory
echo "Changing to the ${gitfiledir} directory"
cd ${gitfiledir}
echo "...done"

# create symlinks (will overwrite old files)
for file in ${files}; do
    echo "Creating symlink to $file in home/bin directory."
    ln -sf ${gitfiledir}/${file} ${homedir}/bin/${file}
done
    


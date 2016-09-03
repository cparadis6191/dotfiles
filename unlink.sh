#!/usr/bin/env bash
# Restore old dotfiles from $olddir back to $HOME


olddir="$HOME/.dotfiles.bak"    # Old dotfiles backup directory

files="bash_profile bashrc gitconfig gitignore_global minttyrc vimrc"    # List of files/folders to symlink in homedir
folders="vim config"
files+=" $folders"

# Remove any symlinks to dotfiles and then move any dotfiles in $olddir back to the home directory, then remove the $olddir folder
for file in $files; do
	if [ -h "$HOME/.$file" ]; then
		echo "Removing symlink for $HOME/.$file"
		rm -f "$HOME/.$file"
	else
		echo "$HOME/.$file is not a symlink"
	fi
done

if [ -d "$olddir" ]; then
	echo "Old dotfiles detected. Starting restore procedure"

	# Restore all files and folders from olddir
	for oldfile in $olddir/* $olddir/.[^.]*; do
		if [ -f "$oldfile" ] || [ -d "$oldfile" ]; then
			echo "Restoring $oldfile to $HOME/`basename $oldfile`"
			mv "$oldfile" "$HOME/`basename $oldfile`"
		fi
	done

	echo "Removing $olddir"
	rmdir "$olddir"

	echo "Original dotfiles restored"
else
	echo "Old dotfiles not detected. Aborting restore procedure"
fi

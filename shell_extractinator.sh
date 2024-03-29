#!/bin/bash

function extractinator {
	if [ -z "$1" ]; then
		# display usage if no parameters given
		echo "Usage: extractinator <path/file.ext> <path/directory-name> (optional)"
	else
		if [ -f $1 ] ; then
			if [ -f $2 ] ; then
				# create directory if one is specified as second param
					DIRNAME=$2
					mkdir $DIRNAME && cd $DIRNAME
				echo "Creating the directory, $DIRNAME to extract into."
			fi
				case $1 in
						*.tar.bz2) tar xvjf $1 ;;
						*.tar.gz) tar xvzf $1 ;;
						*.tar.xz) tar xvJf $1 ;;
						*.lzma) unlzma $1 ;;
						*.bz2) bunzip2 $1 ;;
						*.rar) unrar x -ad $1 ;;
						*.gz) gunzip $1 ;;
						*.tar) tar xvf $1 ;;
						*.tbz2) tar xvjf $1 ;;
						*.tgz) tar xvzf $1 ;;
						*.zip) unzip $1 ;;
						*.Z) uncompress $1 ;;
						*.7z) 7z x $1 ;;
						*.xz) unxz $1 ;;
						*.exe) cabextract $1 ;;
						*) echo "extractinator says: '$1' - unknown archive method" ;;
				esac
			else
				echo "$1 - file does not exist"
		fi
	fi
}

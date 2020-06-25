#!/usr/bin/env zsh

# Example based manpages
function cheat () {
	curl --silent "http://cheat.sh/$1" | less
}


# Copy files to remote server using ssh
function copy_to(){
	# Copy file to remote server
	if [ "$#" -lt 3 ]; then
		echo "Arguments should be :"
		echo "1: username"
		echo "2: hostname"
		echo "3: filename"
	else
		echo "Copying file $3 to $SERVER..."
		scp "$3" "$1@$2:/home/$1"
	fi
}

# Copy files from remote server using ssh
function copy_from(){
	# Copy file from remote server
	if [ "$#" -lt 3 ]; then
		echo "Arguments should be :"
		echo "1: username"
		echo "2: hostname"
		echo "3: filename"
	else
		echo "Copying file $ from $..."
		scp "$1@$2:$3" "$HOME/Downloads"
	fi
}

function chouchou(){
	# Here comes the train
	if [ ! -z "$1" ]; then
		seq 1 "$1" | xargs -I{} sl;
	else
		sl
	fi
}

function hash() {
	echo -n $1 | sha256sum
}

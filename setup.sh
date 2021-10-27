#!/bin/bash

execute_cmd() {
	eval "$*"
	retval=$?
	if [ $retval -ne 0 ]; then
		echo "Command $* returned $retval"
		exit $retval
	fi
}

os=$(cat /etc/os-release | awk -F = '{ if($1 == "ID") { print $2; } }')

execute_cmd pamac update -a
execute_cmd pamac install $(cat packages.$os.txt)
execute_cmd chsh /bin/zsh
execute_cmd chezmoi init git@github.com:deadly-platypus/dotfiles.git
execute_cmd chezmoi apply

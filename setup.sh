#!/bin/bash

execute_function() {
	eval "$*"
	retval=$?
	if [ $retval -ne 0 ]; then
		echo "Command $* returned $retval"
		exit $retval
	fi
}

execute_function pamac update -a
execute_function 

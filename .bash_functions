#!/bin/bash

pathmunge() { 
	if ! echo $PATH | egrep -q "(:|^)$1(:|$)"; then
		if [[ $2 == 'after' ]] ; then
			PATH=$PATH:$1
		else
			PATH=$1:$PATH
		fi
	fi
}
	
follow() {
	tail -f -n 0 $1 | nl 
}

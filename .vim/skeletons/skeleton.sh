#!/bin/bash
#

show_help() {
	cat << EOF
Help information
EOF
}

main() {

}

while [[ $# > 0 ]]; do
	arg="$1"
	case arg in
		-h|--help)
			show_help
			exit
			;;
		*)
			show_help
			exit
			;;
	esac
	shift
done
main

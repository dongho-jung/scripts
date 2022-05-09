#!/usr/bin/env bash

main() {  # add custom entries below, must use `run` function!
	case $1 in
		chrome) run google-chrome;;
		incognito) run google-chrome --incognito;;
	esac
}

run() {
	exec >/dev/null
	i3-msg exec -- $@
	exit
}

main $1

# generates possible options by parsing above case
sed -nr 's/^\s+(.+?)\) run .+;;/\1/p' $0

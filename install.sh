#!/bin/bash

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

for file in $(dirname $(realpath $0))/scripts/*; do
	ln -s `realpath $file` /usr/bin/`basename $file`
done

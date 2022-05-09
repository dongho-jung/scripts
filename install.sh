#!/bin/bash

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

for file in ./scripts/*; do
	ln -s `realpath $file` /usr/bin/`basename $file`
done

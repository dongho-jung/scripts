#!/bin/bash

for file in $(dirname $(realpath $0))/scripts/*; do
    ln -s `realpath $file` $HOME/.local/bin/`basename $file`
done

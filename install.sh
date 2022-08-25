#!/bin/bash

for file in $(dirname $(realpath $0))/scripts/*; do
    ln -s `realpath $file` /usr/local/bin/`basename $file`
done

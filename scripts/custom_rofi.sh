#!/usr/bin/env bash

set -x
DATA_PATH=/tmp/rofi-data

main() {  # add custom entries below
    IFS=';' read cmd arg <<< $(get_cmd_and_arg "$@")

    case $cmd in
        # ENTRY START
        chrome) run google-chrome;;
        incognito) run google-chrome --incognito;;
        killall) _killall "$arg";;
        # ENTRY END
        *) return;;
    esac

    exit
}

_killall() {
    echo -en "\0prompt\x1fkillall\n"

    if [ -z "$1" ]; then
        ps -u $(whoami) -o comm=,pcpu= | awk 'length($1)<15{_[$1] += $2} END{for(comm in _) printf "%s\tcpu:%.2f%\n", comm, _[comm]}' | sort -bgrk2.5,2
        write_data killall
    else
        run killall $1
    fi
}

run() {
    exec >/dev/null
    i3-msg exec -- $@
}

read_data() {
    cat $DATA_PATH
}

write_data() {
    echo $1 > $DATA_PATH
}

get_cmd_and_arg() {

    #1. killall -> data='' $1=killall -> cmd=killall arg=foo
    #2. foo -> data=killall $1=foo -> cmd=killall arg=foo
    #3. killall foo -> data='' $1=killall $2=foo -> cmd=killall arg=foo

    data=$(read_data)
    if [ -z $data ]; then cmd=$1; shift; else cmd=$data; fi
    echo "$cmd;$@"
}

# at initial call of script, empty data
if [ $ROFI_RETV -eq 0 ]; then write_data; fi

main "$@"

# generates possible options by parsing above case
sed -nr '/ENTRY START$/,/ENTRY END$/{s/^\s+(.+)\).+;;$/\1/p}' $0

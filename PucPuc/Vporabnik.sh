#!/bin/bash

PID=$(ps -o pid,args -C bash | awk '/Puc.sh/ { print $1 }')

while read -rsn1 ui; do
    case "$ui" in
    $'\x1b')
        read -rsn1 -t 0.1 tmp
        if [[ "$tmp" == "[" ]]; then
            read -rsn1 -t 0.1 tmp
            case "$tmp" in
            "A") kill -21 $PID;;
            "C") kill -15 $PID;;
            "D") kill -18 $PID;;
            esac
        fi
        read -rsn5 -t 0.1
        ;;
    w) kill -3 $PID;;
    a) kill -12 $PID;;
    d) kill -10 $PID;;
    
    esac
done


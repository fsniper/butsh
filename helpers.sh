#!/bin/bash

function decrease() {

    # Sample
    #   variable=10
    #   decrease variable

    reference=$1
    eval "${reference}=$((${reference}-1))"
}

function increase() {

    # Sample
    #   variable=10
    #   increase variable

    reference=$1
    eval "${reference}=$((${reference}+1))"
}

function in_array() {
    # Sample
    #  if in_array "${A[@]}" "one" ; then
    #    echo "contains one"
    #  fi
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            return 0
        fi
    }
    return 1
}

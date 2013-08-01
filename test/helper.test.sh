#!/bin/bash

DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIRECTORY/../library/bsfl/bsfl
. $DIRECTORY/../helpers.sh


a1=("1" "2" "3" "one" "@@@" "_!?")
var1=0
var2=123


increase var1
if [ $var1 == 1 ]; then
    msg_success "1 increase"
else
    msg_fail "1 increase"
fi

increase var1
if [ $var1 == 2 ]; then
    msg_success "2 increase"
else
    msg_fail "2 increase"
fi

decrease var2
if [ $var2 == 122 ]; then
    msg_success "3 decrease"
else
    msg_fail "3 decrease"
fi

var1=0
decrease var1
if [ $var1 == -1 ]; then
    msg_success "4 decrease"
else
    msg_fail "4 decrease"
fi


if in_array "${a1[@]}" "one" ; then
    msg_success "5 in_array"
else
    msg_fail "5 in_array"
fi

# Should not contain so reverse success
if in_array "${a1[@]}" "o n e"; then
    msg_fail "6 in_array"
else
    msg_success "6 in_array"
fi


if in_array "${a1[@]}" "_!?" ; then
    msg_success "7 in_array"
else
    msg_fail "7 in_array"
fi




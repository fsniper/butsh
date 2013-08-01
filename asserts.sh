#!/bin/bash


function butsh_success() {
    increase BUTSH_SUCCESS_COUNT
    msg_success "$1"
}

function butsh_fail() {
    increase BUTSH_FAIL_COUNT
    msg_fail "$1"
}

function assert() {
    # checks if the parameter is a true value like 'true' 'y' 'yes' 'ok' 'success' 'succeeded' or '0'
    increase BUTSH_TEST_COUNT
    params=$(tolower "$1")
    message="$2"

    values=('true' 'y' '0' 'ok' 'success' 'succedeed')
    if in_array ${values[@]} $params ; then
        butsh_success "$message"
    else
        butsh_fail "$message"
    fi
}

function assert_false() {
    # checks if the parameter is a false value like 'false' 'n' 'no' 'nok' 'fail' 'failed' or not 0
    increase BUTSH_TEST_COUNT
    params=$(tolower "$1")
    message="$2"

    values=('false' 'n' 'nok' 'fail' 'failed')
    if in_array ${values[@]} $params ; then
        butsh_success "$message"
    else
        if [[ $params == ?(-)+([0-9]) && $params -ne 0 ]]; then
            butsh_success "$message"
        else
            butsh_fail "$message"
        fi
    fi
}


function assert_command_success() {
    # checks if a command succeeds with retcode 0
    increase BUTSH_TEST_COUNT
    output=$($1)
    retcode=$?
    message="$2"

    if [ $retcode == 0 ] ; then
        butsh_success "$message"
    else
        butsh_fail "$message"
    fi
}

function assert_command_fail() {
    # checks if a command not succeeds with retcode 0
    increase BUTSH_TEST_COUNT
    output=$($1)
    retcode=$?
    message="$2"

    if [ $retcode == 0 ] ; then
        butsh_fail "$message"
    else
        butsh_success "$message"
    fi
}

function assert_eval_success() {
    # checks if a command succeeds with retcode 0
    increase BUTSH_TEST_COUNT
    output=$(eval "$1")
    retcode=$?
    message="$2"

    if [ $retcode == 0 ] ; then
        butsh_success "$message"
    else
        butsh_fail "$message"
    fi
}

function assert_eval_fail() {
    # checks if a command not succeeds with retcode 0
    increase BUTSH_TEST_COUNT
    output=$(eval "$1")
    retcode=$?
    message="$2"

    if [ $retcode == 0 ] ; then
        butsh_fail "$message"
    else
        butsh_success "$message"
    fi
}


function assert_integer() {
    # checks if the parameter is an integer
    increase BUTSH_TEST_COUNT
    message="$2"

    if [[ $params == ?(-)+([0-9]) ]]; then
        butsh_success "$message"
    else
        butsh_fail "$message"
    fi
}

function assert_equal() {
    # checks if the parameter is an integer
    increase BUTSH_TEST_COUNT
    v1="$1"
    v2="$2"
    message="$3"

    if [[ "$v1" == "$v2" ]]; then
        butsh_success "$message"
    else
        butsh_fail "$message"
    fi
}

function assert_not_equal {
    # checks if the parameter is an integer
    increase BUTSH_TEST_COUNT
    v1="$1"
    v2="$2"
    message="$3"

    if [[ "$v1" != "$v2" ]]; then
        butsh_success "$message"
    else
        butsh_fail "$message"
    fi
}

function assert_file_size_not_zero {
    # checks if the file exists and has a non zero filesize
    increase BUTSH_TEST_COUNT
    file=$1
    message="$2"

    if [[ -s $file ]]; then
        butsh_success "$message"
    else
        butsh_fail "$message"
    fi
}
function assert_file_size_zero {
    # checks if the file exists and has a non zero filesize
    increase BUTSH_TEST_COUNT
    file=$1
    message="$2"

    if [[ -s $file ]]; then
        butsh_fail "$message"
    else
        butsh_success "$message"
    fi
}

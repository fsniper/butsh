#!/bin/bash

# Depends on http://code.google.com/p/bsfl/

function butsh_check_for_bsfl() {
    echo -e "\e[00;33mChecking for bsfl\e[00m"
    if [ -d "$BSFL_DIRECTORY" -a -f "$BSFL_DIRECTORY/bsfl" ]; then
        echo -e "\e[00;32mOk bsfl is in place\e[00m"
    else
        if [ $BSFL_CHECKOUT == "true" ]; then
            echo -e "\e[00;33mbsfl library is not in place. Trying to checkout\e[00m"
            svn checkout $BSFL_SVN_REPO $BSFL_DIRECTORY
            if [ "$?" -ne "0" ]; then
                echo "\e[00;32mFailed to checkout. Exiting\e[00m"
                exit -3
            fi
        else
            echo "\e[00;32mbsfl library is not in place. Download and install into $BSFL_DIRECTORY/bsfl \e[00m"
            exit -2
        fi
    fi
}

function butsh_echo_results() {
    msg_info "All tests are done."
    msg_fail "Fail count: $BUTSH_FAIL_COUNT"
    msg_success "Success count: $BUTSH_SUCCESS_COUNT"
}

function butsh_check() {
    butsh_check_for_bsfl
}

function butsh_init_bfsl() {
    DONOTLOG=n
    . $BSFL_DIRECTORY/bsfl
}

function butsh_init_asserts() {
    . $BUTSH_DIRECTORY/asserts.sh
}

function butsh_init_helpers() {
    butsh_init_bfsl
    . $BUTSH_DIRECTORY/helpers.sh
}

function butsh_init() {

    BUTSH_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    . $BUTSH_DIRECTORY/config.inc.sh

    BUTSH_TEST_COUNT=0
    BUTSH_FAIL_COUNT=0
    BUTSH_SUCCESS_COUNT=0

    shopt -s extglob

    butsh_check
    butsh_init_helpers
    butsh_init_asserts
}

# initialize butsh
butsh_init

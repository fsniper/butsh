#!/bin/bash


########################################
#
#  Configuration File for butsh.
#  never run just sourced by butsh
#
#
#########################################

if [ $0 == 'config.inc.sh' ]; then
    echo -e "\e[00;31mDo not run this file. It will be imported by butsh\e[00m"
    exit -1
fi

BUTSH_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BSFL_DIRECTORY=$BUTSH_DIRECTORY/library/bsfl
BSFL_CHECKOUT=true
BSFL_SVN_REPO=http://bsfl.googlecode.com/svn/trunk/


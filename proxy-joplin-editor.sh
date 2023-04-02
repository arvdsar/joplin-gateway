#!/usr/bin/env bash

if [[ "${1}x" == "x" ]] ; then
    echo "Usage: `basename $0` file"
    exit 1
fi

if [[ ! -f $1 ]]; then
    echo "Parameter is not an existing file name"
    exit 1
fi

# include functions
readonly CURR_WD=`pwd`
cd "$(dirname "$0")";
. ./config-defaults.sh
cd ${CURR_WD}

cat $TEMP_APPEND_FILE >> $1

rm $TEMP_APPEND_FILE
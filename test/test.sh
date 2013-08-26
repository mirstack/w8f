#!/bin/bash

PATH="./bin:$PATH"
FAILED=0
ALL=0
CURRENT=

error()
{
    echo "@$CURRENT"
    echo " --> $@" >&2

    FAILED=$((FAILED+1))
}

for t in ./test/test-*; do
    . $t;
done

suite=$(typeset -F | sed 's/declare -f //' | grep '^test')

for test in ${suite[@]}; do
    ALL=$((ALL+1))
    CURRENT=$test
    $test
done


if (( $FAILED > 0 )); then
    echo
    echo "Failure! Failed $FAILED out of $ALL tests."
    exit 1
else
    echo "Success! All $ALL tests passed."
fi

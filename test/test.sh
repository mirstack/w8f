#!/bin/bash

PATH="./bin:$PATH"

. ./test/assert.sh

for t in ./test/test-*; do
    . $t;
done

suite=$(typeset -F | sed 's/declare -f //' | grep '^test')

for test in ${suite[@]}; do
    $test
done

assert_end examples

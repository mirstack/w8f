test_w8f_fails_when_no_file_path_given()
{
    output=$(w8f 2>&1 | head -n1)

    if [[ $output != "./bin/w8f: missing argument -- 'FILE'" ]]; then
        error "expected to fail when no file given, got success"
    fi
}

test_w8f_works_fine_when_watched_file_created()
{
    file=/tmp/w8f-test
    rm -rf $file
    (sleep 1 && touch $file) &
    w8f $file
    rc=$?

    if (( $rc != 0 )); then
        error "expected success when watched file is created, got error: $rc"
    fi
}

test_w8f_fails_when_timeout_reached()
{
    file=/tmp/w8f-test
    rm -rf $file
    (sleep 2 && touch $file) &
    w8f -t1 $file 2>/dev/null
    rc=$?

    if (( $rc == 0 )); then
        error "expected failure when timeout reached, got success"
    fi
}

test_w8f_custom_interval()
{
    file=/tmp/w8f-test
    rm -rf $file
    (sleep 1 && touch $file) &
    w8f -t1 -i2 $file 2>/dev/null
    rc=$?

    if (( $rc == 0 )); then
        error "expected failure when timeout on big interval reached, got success"
    fi

}

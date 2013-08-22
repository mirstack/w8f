test_w8f_fails_when_no_file_path_given()
{
    assert \
        "w8f 2>&1 >/dev/null" \
        "ERROR -- missing file name"
}

test_w8f_works_fine_when_watched_file_created()
{
    file=/tmp/w8f-test
    rm -rf $file
    (sleep 1 && touch $file) &
    assert_raises "w8f $file" 0
}

test_w8f_does_not_exit_when_different_file_is_created()
{
    file1=/tmp/w8f-test1
    file2=/tmp/w8f-test2
    result=/tmp/w8f-result
    rm -rf $file1 $file2 $result
    exec 2>/dev/null
    w8f $file1 &
    pid=$!
    touch $file2

    assert_raises "kill -0 $pid" 0
    kill $pid &>/dev/null
}

#!/bin/sh

test_description='test sha1 collision detection'
. ./test-lib.sh
TEST_DATA="$TEST_DIRECTORY/t0013"

if test -z "$USE_SHA1DC"
then
	skip_all='skipping sha1 collision tests, USE_SHA1DC not set'
	test_done
fi

test_expect_success 'test-sha1 detects shattered pdf' '
	test_must_fail test-sha1 <"$TEST_DATA/shattered-1.pdf" 2>err &&
	test_i18ngrep collision err &&
	grep 38762cf7f55934b34d179ae6a4c80cadccbb7f0a err
'

test_done
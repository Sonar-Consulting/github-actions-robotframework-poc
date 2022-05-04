#!/usr/bin/env bash
set -e
export DISPLAY=:1
# Run an individual test suite if the TEST_SUITE environmental variable is set.
if [ -z "$TEST_SUITE" ]; then
    TEST_SUITE=""
fi

CMD="robot --console verbose --outputdir /reports /tests/$TEST_SUITE"

echo ${CMD}

``${CMD}``
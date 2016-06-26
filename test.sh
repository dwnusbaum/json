#!/bin/bash
total=$((0))
failures=$((0));

for file in test/pass/*.json; do
    test/bin/test "$file" "-s"
    returnCode=$?
    ((total++))
    if [ $returnCode -ne "0" ]; then
        echo "$file should have passed, but it failed."
        ((failures++))
        continue
    fi
done

echo "$((total-failures))/$total tests correctly passed."

total=$((0))
failures=$((0));

for file in test/fail/*.json; do
    test/bin/test "$file" "-s"
    returnCode=$?
    ((total++))
    if [ $returnCode -ne "1" ]; then
        echo "$file should have failed, but it passed."
        ((failures++))
        continue
    fi
done


echo "$((total-failures))/$total tests correctly failed."

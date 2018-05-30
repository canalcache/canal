#!/bin/bash

TESTDIR="
arrayAccess
bubbleSort
insertionSort
aes
des
"

for name in $TESTDIR
do
    echo "============== Run $name =============="
    ./single_run.sh benchmarks/$name
    ./get_number_ours.sh benchmarks/$name
    echo "============== Done $name =============="
done

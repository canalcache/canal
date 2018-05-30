#!/bin/bash

TESTDIR="
gcd-01
sanfoundry-02
standard-init-01
sum02
copysome-01
"

for name in $TESTDIR
do
    echo "============ Run $name ==============="
    ./single_run.sh benchmarks/$name
    ./run_smack.sh benchmarks/$name
    echo "============ Done $name ==============="
done

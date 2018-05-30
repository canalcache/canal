#!/bin/bash

TESTDIR="
copysome-01
copysome-01-unroll
gcd-01
gcd-01-unroll
sanfoundry-02
sanfoundry-02-unroll
standard-init-01
standard-init-01-unroll
sum02
sum02-unroll
"

for name in $TESTDIR
do
    echo "============ Run $name ==============="
    ./single_run.sh benchmarks/$name
    ./run_crabllvm.sh benchmarks/$name
    echo "============ Done $name ==============="
done

#!/bin/bash

TESTDIR="
copysome-01-interfere
copysome-01-noninterfere
gcd-01
sanfoundry-02-interfere
sanfoundry-02-noninterfere
standard-init-01-interfere
standard-init-01-noninterfere
sum02
"

for name in $TESTDIR
do
    echo "============ Run $name ==============="
    ./single_run.sh benchmarks/$name
    ./run_klee.sh benchmarks/$name
    echo "============ Done $name ==============="
done

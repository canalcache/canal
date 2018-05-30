#!/bin/bash

if [[ -z $1 ]]; then
	echo "I want a save dir name"
	exit 1
fi

save_dir=$1

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
	dir=benchmarks/$name
	mkdir -p $dir/$save_dir
	mv $dir/run_klee.time $dir/$save_dir
done

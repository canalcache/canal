#!/bin/bash

if [[ -z $1 ]]; then
	echo "usage: $0 <prog-dir>"
	echo "e.g.: $0 aes/"
	exit 1
fi

TIME="`which time` -f %e"

cd $1

echo "==== getting cache stats for $1's main.bc ===="

$TIME -o csim_run.time /usr/lib/llvm-3.8/build/bin/lli main.bc

echo "==== Done ===="


#!/bin/bash

if [[ -z $1 ]]; then
	echo "usage: $0 <prog-dir>"
	echo "e.g.: $0 aes/"
	exit 1
fi

BENCHDIR=$1

cd $BENCHDIR

../../../../bin/canal.sh --orig-file test_gem5.c --verify-file main.c --cache-line-size 64 --cache-size 1 --cache-assoc 4 --llvm-version 3.8

echo "==============  Done =============="



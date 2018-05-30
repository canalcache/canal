#!/bin/bash

if [[ -z $1 ]]; then
	echo "usage: $0 <prog-dir>"
	echo "e.g.: $0 aes/"
	exit 1
fi

# Need to set gem5 directory 
GEM5DIR=/home/gpsim/gem5

TIME="`which time` -f %e"

SECONFIC="--caches --l1d_size=1kB --l1d_assoc=4 --num-cpus=1 --cacheline_size=64 --num-l2caches=0 --num-l3caches=0"

ORIGINALDIR=`pwd`

cd $1

CLANG_38=/usr/lib/llvm-3.8/build/bin/clang

#$CLANG_38 -O0 base_gem5.c -I/home/gpsim/gem5/include -L/home/gpsim/gem5/util/m5 -lm5 -o base_gem5
$CLANG_38 -O0 base_gem5.c -o base_gem5

#$CLANG_38 -O0 test_gem5.c -I/home/gpsim/gem5/include -L/home/gpsim/gem5/util/m5 -lm5 -o test_gem5
$CLANG_38 -O0 test_gem5.c -o test_gem5

cp base_gem5 $GEM5DIR/tests/test-progs/ourTest/base_gem5
cp test_gem5 $GEM5DIR/tests/test-progs/ourTest/test_gem5

STAT1=base_gem5_stats.txt
STAT2=test_gem5_stats.txt


cd $GEM5DIR
#build/X86/gem5.opt --debug-flags=Exec,Cache --debug-file=trace1.txt configs/example/se.py -c tests/test-progs/ourTest/base_gem5 ${SECONFIC}
build/X86/gem5.opt configs/example/se.py -c tests/test-progs/ourTest/base_gem5 ${SECONFIC}
mv m5out/stats.txt m5out/$STAT1

#build/X86/gem5.opt --debug-flags=Exec,Cache --debug-file=trace2.txt configs/example/se.py -c tests/test-progs/ourTest/test_gem5 ${SECONFIC}
$TIME -o gem5_run.time build/X86/gem5.opt configs/example/se.py -c tests/test-progs/ourTest/test_gem5 ${SECONFIC}
mv m5out/stats.txt m5out/$STAT2

mv gem5_run.time $ORIGINALDIR/$1

STAT_NAMES="
system.cpu.dcache.overall_accesses::total
system.cpu.dcache.ReadReq_accesses::total
system.cpu.dcache.ReadReq_hits::total
system.cpu.dcache.ReadReq_misses::total
system.cpu.dcache.WriteReq_accesses::total
system.cpu.dcache.WriteReq_hits::total
system.cpu.dcache.WriteReq_misses::total
"

for name in $STAT_NAMES; do
        stat1=$( grep "$name" m5out/$STAT1 | grep -m 1 -o -E "[0-9]*")
        stat2=$( grep "$name" m5out/$STAT2 | grep -m 1 -o -E "[0-9]*")
        diff=$( python -c "print str($stat2 - $stat1)" )
        echo "$name             $diff"
done


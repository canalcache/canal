KLEE=/home/gpsim/klee/build/bin/klee


TIME="`which time` -f %e"

BENCHDIR=${1}

cd $BENCHDIR

$TIME -o run_klee.time $KLEE -exit-on-error-type=Assert newFile_afterPass.bc > klee_results.txt
#$KLEE -exit-on-error-type=Assert newFile_afterPass.bc 

cd -

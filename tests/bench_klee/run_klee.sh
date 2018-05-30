KLEE=/home/gpsim/klee/build/bin/klee


TIME="`which time` -f %e"

BENCHDIR=${1}

cd $BENCHDIR

$TIME -o run_klee.time $KLEE -exit-on-error-type=Assert main.bc > klee_results.out

cd -

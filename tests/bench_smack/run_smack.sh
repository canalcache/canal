export BOOGIE="mono /home/gpsim/boogie/Binaries/Boogie.exe"
export CORRAL="mono /home/gpsim/corral/bin/Release/corral.exe"
export LOCKPWN="mono /home/gpsim/lockpwn/Binaries/lockpwn.exe"

TIME="`which time` -f %e"

BENCHDIR=${1}

cd $BENCHDIR

SMACK_CONF="--unroll 10 -v --time-limit 3600"

$TIME -o run_smack.time smack main.bc ${SMACK_CONF} > smack_results.out

cd ../..

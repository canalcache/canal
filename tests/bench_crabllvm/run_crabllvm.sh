#!/bin/bash

CRAB=/home/gpsim/crab-llvm/build/_DIR_/bin/crabllvm
CRAB_PP=/home/gpsim/crab-llvm/build/_DIR_/bin/crabllvm-pp

TIME="`which time` -f %e"

# assume there is bc file

BENCHDIR=${1}

cd ${BENCHDIR}


echo "crab pre-processing"
${CRAB_PP} main.bc -crab-inline-all -crab-lower-unsigned-icmp -o pp.bc
${LLVM_38} pp.bc
echo "====== Done ======"

echo "run crab"
$TIME -o run_crab.time ${CRAB} pp.bc -crab-add-invariants=all -crab-check=assert -crab-dom=int -crab-track=arr -crab-inter -crab-print-invariants > crab_results.txt
echo "====== Done ======"

cd ../..

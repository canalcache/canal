## Summary

Test directory for running CANAL as a simulator, running with KLEE, SMACK and Crab-llvm

## Directory

 * bench_base: example programs to run CANAL as a simulator
   - buildPass.sh: build our pass under LLVM 3.8
   - single_run.sh ``testDir``: run the pass to produce main.bc (ex. ./single_run.sh benchmarks/bubbleSort)
   - get_number_canal.sh ``tesdDir``: run main.bc to get cache hit/miss numbers
   - get_number_gem5.sh ``testDir``: run Gem5 to get cache hit/miss numbers
 
 * bench_klee: example programs to run CANAL with KLEE
   - buildPass.sh: build our pass under LLVM 3.4
   - single_run.sh ``testDir``: run the pass to produce main.bc (ex. ./single_run.sh benchmarks/sum02)
   - run_klee.sh ``testDir``: run KLEE with main.bc to do interference analysis (ex. ./run_klee.sh benchmarks/sum02)

 * bench_crabllvm: example programs to run CANAL with Crab-llvm
   - buildPass.sh: build our pass under LLVM 3.8
   - single_run.sh ``testDir``: run the pass to produce main.bc (ex. ./single_run.sh benchmarks/copysome-01)
   - run_crabllvm.sh ``testDir``: run Crab-llvm with main.bc to do abstract interpretation (ex. ./run_crabllvm.sh benchmarks/copysome-01)

 * bench_smack: example programs to run CANAL with SMACK
   - buildPass.sh: build our pass under LLVM 3.8
   - single_run.sh ``testDir``: run the pass to produce main.bc (ex. ./single_run.sh benchmarks/copysome-01)
   - run_smack.sh ``testDir``: run SMACK with main.bc to do bounded model checking (ex. ./run_smack.sh benchmarks/copysome-01)

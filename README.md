## Summary
 - Cache Timing Analysis Framework via LLVM transformation (the tool demo paper is under submission in the ASE 2018 Tool Demo track)
 - CANAL makes C code cache-verifiable through all kinds of LLVM-based verification tools
 - CANAL produces LLVM-bitcode which can be ran as a simulator or verified with LLVM-based verification tools.


## Contributors
 - Chungha Sung (chunghas[@]usc[dot]edu)
 - Brandon Paulson (bpaulsen[@]usc[dot]edu)
 - Chao Wang (wang626[@]usc[dot]edu)


## Depednecy
 - It has been tested under Clang/LLVM 3.4.0 and 3.8.0
 - (optional) KLEE (https://klee.github.io/)
 - (optional) SMACK (https://github.com/smackers/smack)
 - (optional) Crab-llvm (https://github.com/seahorn/crab-llvm)

## Build
 - Change environment paths appropriately for the test (check bin/common.sh)
 - Under ``src``, type ``mkdir build``.
 - Then, ``cmake ../`` and ``make`` to build (under assumption cmake and llvm are installed)
 - Or, by running ``buildPass.sh`` under each bench directory you can build CANAL.

## Helpful links
 - Simple introduction and description of CANAL on Youtube (https://youtu.be/JDou3F1j2nY)
 - We provide a VM with all programs tested in the paper installed at the link (https://drive.google.com/file/d/1kKTKby8TWoXaXPjUNA7aoYkwjugjauwS/view) - account&passwd:ase2018

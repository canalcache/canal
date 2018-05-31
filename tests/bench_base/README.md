All benchmarks are tested under this cache specification.
Total Address Bits:64
Total Cache Size (KB):1
Associativity:4
Cache Line Size (B):64

It may not work under different specification due to cache flush operations & cache optimizations.

* Before running
- set environment variables in export.sh

* How to run?
- ./buildPass.sh : it builds the pass
- ./get_nubmer_gem5.sh DIR : get numbers using gem5
- ./single_run.sh DIR : instrument the code with our pass
- ./get_number_ours.sh DIR : get number using our tool

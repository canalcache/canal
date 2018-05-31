/*
 * Date: 2018. 03. 28.
 * Author: Chungha Sung (chunghas@usc.edu)
 * The code has been changed to test CacheSim.
 * The original code is from SV-COMP repository (https://github.com/sosy-lab/sv-benchmarks)
 * The file name is c/bitvector/sum02_false-unreach-call_true-no-overflow.c
 */

//extern void __VERIFIER_error() __attribute__ ((__noreturn__));
//void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: __VERIFIER_error(); } }

// The running result (fixed)

//#include "smack.h"

#define N 10

//extern unsigned int __VERIFIER_nondet_uint();
unsigned int i __attribute__ ((aligned (64)));
unsigned int n __attribute__ ((aligned (64)));
unsigned int sn __attribute__ ((aligned (64)));
unsigned int k __attribute__ ((aligned (64)));


void __CSIM_MAIN__()
{
    //__CSIM_init_cache();

    //n = __VERIFIER_nondet_uint();
    n = 10;
    sn = 0;

    for (i=0; i<=n; i++) {
        sn = sn + i;
        //assert(__CSIM_write_ret == false);  // expect: violated
    }

}

int main ( ) 
{
    __CSIM_MAIN__();
    return 0;
}

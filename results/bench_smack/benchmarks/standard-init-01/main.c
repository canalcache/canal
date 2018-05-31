/*
 * Date: 2018. 03. 28.
 * Author: Chungha Sung (chunghas@usc.edu)
 * The code has been changed to test CacheSim.
 * The original code is from SV-COMP repository (https://github.com/sosy-lab/sv-benchmarks)
 * The file name is c/array-examples/standard_init1_false_unreach-call_ground.c
 */

//extern void __VERIFIER_error() __attribute__ ((__noreturn__));
//void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: __VERIFIER_error(); } }

// The running result (fixed)

#include "smack.h"

#define N 10

int a[200] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));

void __CSIM_MAIN__()
{
    __CSIM_init_cache();

    i = 0;
    while ( i < N ) {
        a[i] = 42;
        assert(__CSIM_Store_ret == true);  // expect: violated
        i = i + 1;
    }

}

int main ( ) 
{
    __CSIM_MAIN__();
    return 0;
}

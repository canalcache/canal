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
#include <assert.h>
#include "klee/klee.h"

#define N 10

extern void __CRAB_assert(int);
extern unsigned int __VERIFIER_nondet_uint();
extern int nd();

unsigned int n __attribute__ ((aligned (64)));
unsigned int i __attribute__ ((aligned (64)));
unsigned int sn __attribute__ ((aligned (64)));


void __CSIM_MAIN__(unsigned int tmp)
{
    n = 5;
    sn = 0;
    i = tmp;

    for (; i<=n; i++) {
        sn = sn + i;
    }
}

int main ( ) 
{
	unsigned int i1, i2;
	unsigned int access1, miss1, access2, miss2;
	klee_make_symbolic(&i2, sizeof(unsigned int), "i2");
	klee_make_symbolic(&i1, sizeof(unsigned int), "i1");
	__CSIM_init_cache();
    __CSIM_MAIN__(i1);
	access1 = __CSIM_num_Store_hit + __CSIM_num_Store_miss + __CSIM_num_Load_hit + __CSIM_num_Load_miss;
	miss1 = __CSIM_num_Store_miss + __CSIM_num_Load_miss;
	
	__CSIM_init_cache();
    __CSIM_MAIN__(i2);
	access2 = __CSIM_num_Store_hit + __CSIM_num_Store_miss + __CSIM_num_Load_hit + __CSIM_num_Load_miss;
	miss2 = __CSIM_num_Store_miss + __CSIM_num_Load_miss;

	assert(access1 == access2);
	assert(miss1 == miss2);

    return 0;
}

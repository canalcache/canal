/*
 * Date: 2018. 03. 28.
 * Author: Chungha Sung (chunghas@usc.edu)
 * The code has been changed to test CacheSim.
 * The original code is from SV-COMP repository (https://github.com/sosy-lab/sv-benchmarks)
 * The file name is c/array-programs/copysome1_false-unreach-call.c
 */

/*
 * Benchmarks contributed by Shrawan Kumar, TCS Innovation labs, Pune
 *
 * It implements partial copy and 
 * check property accordingly
 */

//extern void __VERIFIER_error() __attribute__ ((__noreturn__));
//void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: __VERIFIER_error(); } }

// The running result (fixed)
#include "klee/klee.h"
#include <assert.h>

#define N 10

int a1[200] __attribute__ ((aligned (64)));
int a2[200] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));
int z __attribute__ ((aligned (64)));


void __CSIM_MAIN__(int p)
{
    z = p;

    for ( i = 0 ; i < N ; i++ ) {
        a1[i] = 5;
        if (i != z)
        	a2[i] = 5;
		else
        	a2[i] = z;
    }


    for ( i = 0 ; i < N ; i++ ) {
        if (a1[i] != a2[i])
            a2[199] = a1[i];
    }

}

int main ( ) 
{
	int a2, a1;
	unsigned int access1, miss1, access2, miss2;
	klee_make_symbolic(&a2, sizeof(int), "a2");
	klee_make_symbolic(&a1, sizeof(int), "a1");
	__CSIM_init_cache();
    __CSIM_MAIN__(a2);
	access1 = __CSIM_num_Store_hit + __CSIM_num_Store_miss + __CSIM_num_Load_hit + __CSIM_num_Load_miss;
	miss1 = __CSIM_num_Store_miss + __CSIM_num_Load_miss;
	
	__CSIM_init_cache();
    __CSIM_MAIN__(a1);
	access2 = __CSIM_num_Store_hit + __CSIM_num_Store_miss + __CSIM_num_Load_hit + __CSIM_num_Load_miss;
	miss2 = __CSIM_num_Store_miss + __CSIM_num_Load_miss;

	assert(access1 == access2);
	assert(miss1 == miss2);

    return 0;
}

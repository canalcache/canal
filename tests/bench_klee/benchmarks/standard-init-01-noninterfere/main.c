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

#include "klee/klee.h"
#include <assert.h>

#define N 12
#define SIZE 200

int a[SIZE] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));
int non_det_int();

void __CSIM_MAIN__(int multi)
{
    i = 0;
	while (i < SIZE) {
		a[i] = 1;
		i++;
	}

	i = 0;
    while ( i < N ) {
        if ((i % (multi + 1)) == 0) {
            a[i] = 42;
        } else {
            a[i*multi] = 42;
        }
        i = i + 1;
    }
}

int main() {
	int a, b;
	unsigned int access1, writemiss1, access2, writemiss2;
	klee_make_symbolic(&a, sizeof(int), "a");
	klee_make_symbolic(&b, sizeof(int), "b");
	klee_assume(a != b);
	klee_assume(a <= 16);
	klee_assume(a >= 0);
	klee_assume(b <= 16);
	klee_assume(b >= 0);

	__CSIM_init_cache();
	__CSIM_MAIN__(a);
	access1 = __CSIM_num;
	writemiss1 = __CSIM_num_Store_miss;

	__CSIM_init_cache();
	__CSIM_MAIN__(b);
	access2 = __CSIM_num;
	writemiss2 = __CSIM_num_Store_miss;

	assert(access1 == access2);
	assert(writemiss1 == writemiss2);
    return 0;
}

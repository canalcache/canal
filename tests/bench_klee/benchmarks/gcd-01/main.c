/*
 * Date: 2018. 03. 28.
 * Author: Chungha Sung (chunghas@usc.edu)
 * The code has been changed to test CacheSim.
 * The original code is from SV-COMP repository (https://github.com/sosy-lab/sv-benchmarks)
 * The file name is c/bitvector/gcd_1_true-unreach-call_true-no-overflow.c
 */

#include <assert.h>
#include "klee/klee.h"

signed char t __attribute__ ((aligned (64)));

void __CSIM_MAIN__(signed char x, signed char y)
{
    if (y > 0 && x % y == 0) {
        //g = gcd_test(x, y);
        if (x < 0) x = -x;
        if (y < 0) y = -y;

        while (y != 0) {
            t = y;
            y = x % y;
            x = t;
        }
    }
}


int main()
{
	signed char x1, y1, x2, y2;
	unsigned int access1, miss1, access2, miss2;
	klee_make_symbolic(&x2, sizeof(signed char), "x2");
	klee_make_symbolic(&x1, sizeof(signed char), "x1");
	klee_make_symbolic(&y2, sizeof(signed char), "y2");
	klee_make_symbolic(&y1, sizeof(signed char), "y1");
	__CSIM_init_cache();
    __CSIM_MAIN__(x1, y1);
	access1 = __CSIM_num;
	miss1 = __CSIM_num_Store_miss + __CSIM_num_Load_miss;

	
	__CSIM_init_cache();
    __CSIM_MAIN__(x2, y2);
	access2 = __CSIM_num;
	miss2 = __CSIM_num_Store_miss + __CSIM_num_Load_miss;

	assert(access1 == access2);
	assert(miss1 == miss2);

    return 0;
}

#include "klee/klee.h"
#include <assert.h>

int k[32] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));
int multi __attribute__ ((aligned (64)));

void simple(int tmp)
{
    multi = tmp;
    k[0] = 42;

    if (multi < 5)
        k[0] = 42;
    else 
        k[16] = 42;
}

int main() {
	int a, b;
	unsigned int access1, writemiss1, access2, writemiss2;
	klee_make_symbolic(&a, sizeof(int), "a");
	klee_make_symbolic(&b, sizeof(int), "b");

	__CSIM_init_cache();
	simple(a);
	access1 = __CSIM_num_Store_hit + __CSIM_num_Store_miss + __CSIM_num_Load_hit + __CSIM_num_Load_miss;
	writemiss1 = __CSIM_num_Store_miss;

	__CSIM_init_cache();
	simple(b);
	access2 = __CSIM_num_Store_hit + __CSIM_num_Store_miss + __CSIM_num_Load_hit + __CSIM_num_Load_miss;
	writemiss2 = __CSIM_num_Store_miss;

	assert(access1 == access2);
	assert(writemiss1 == writemiss2);
    return 0;
}

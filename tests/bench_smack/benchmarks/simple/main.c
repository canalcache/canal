#include "smack.h"

extern unsigned int __VERIFIER_nondet_uint();
unsigned int i __attribute__ ((aligned (64)));
unsigned int n __attribute__ ((aligned (64)));
unsigned int sn __attribute__ ((aligned (64)));
unsigned int k __attribute__ ((aligned (64)));

void simple()
{
    __CSIM_init_cache();

    n = __VERIFIER_nondet_uint();

    for (i=0; i<=n; i++) {
        k = sn + i;
        assert(__CSIM_Store_ret == false);  // expect: violated
    }

}

int main ( ) 
{
    simple();
    return 0;
}

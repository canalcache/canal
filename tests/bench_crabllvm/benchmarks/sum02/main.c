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


#define N 10

extern void __CRAB_assert(int);
extern unsigned int __VERIFIER_nondet_uint();
extern int nd();

unsigned int i __attribute__ ((aligned (64)));
unsigned int n __attribute__ ((aligned (64)));
unsigned int sn __attribute__ ((aligned (64)));


void __CSIM_MAIN__()
{
    __CSIM_init_cache();

    n = 5;
    sn = 0;

    for (i=0; i<=n; i++) {
        if (nd())
            sn = sn + i;
    }

    // check cache variables

    __CRAB_assert(__CSIM_num_Store_hit > 1);     // [0, inf.]
    __CRAB_assert(__CSIM_num_Store_miss > 1);    // [3, 3]
    __CRAB_assert(__CSIM_num_Load_hit > 1);      // [2, inf.]
    __CRAB_assert(__CSIM_num_Load_miss > 1);     // [0, 0]


}

int main ( ) 
{
    __CSIM_MAIN__();
    return 0;
}

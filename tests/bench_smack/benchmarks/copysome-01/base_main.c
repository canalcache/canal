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

//#include "smack.h"

#define N 10


//int __VERIFIER_nondet_int();

//extern unsigned int __VERIFIER_nondet_uint();
int a1[200] __attribute__ ((aligned (64)));
int a2[200] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));
int z __attribute__ ((aligned (64)));


void __CSIM_MAIN__()
{
    //__CSIM_init_cache();

    z = 150000;

    for ( i = 0 ; i < N ; i++ ) {
        //a1[i] = __VERIFIER_nondet_int();
        //a2[i] = __VERIFIER_nondet_int();
        a1[i] = 10;
        a2[i] = 10;
    }


    for ( i = 0 ; i < N ; i++ ) {
        if (i != z)
            a2[i] = a1[i];

        //assert(__CSIM_read_ret == false); // expect: violated
    }

    /*
    int x;
    z = 150001;
    for ( x = 0 ; x < N ; x++ ) {
        if (x != z)
            __VERIFIER_assert(  a1[x] == a2[x]  );
    }
    */

}

int main ( ) 
{
    __CSIM_MAIN__();
    return 0;
}

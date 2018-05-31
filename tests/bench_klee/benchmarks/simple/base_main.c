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

//extern int nd();
//extern void __CRAB_assert(int);

#define N 10

int k[200] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));
int multi __attribute__ ((aligned (64)));

void __CSIM_MAIN__()
{
    //__CSIM_init_cache();

    i = 0;
    while ( i < N ) {
        //if (nd()) {
            k[i] = 42;
        //} else {
            k[i*16] = 42;
        //}
        //a[i] = 42;
        i = i + 1;
    }

    // omitted checking assertion part. Instead, inserted assert check for cache variables

    /*
    __CRAB_assert(__CSIM_num_write_access > 1);
    __CRAB_assert(__CSIM_num_write_hit > 1);
    __CRAB_assert(__CSIM_num_write_miss > 1);
    __CRAB_assert(__CSIM_num_read_access > 1);
    __CRAB_assert(__CSIM_num_read_hit > 1);
    __CRAB_assert(__CSIM_num_read_miss > 1);
    */

    /*
    int x;
    for ( x = 0 ; x < N ; x++ ) {
        __VERIFIER_assert(  a[x] == 43  );
    }
    */
}

int main ( ) 
{
    __CSIM_MAIN__();
    return 0;
}

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

#define N 5


int __VERIFIER_nondet_int();
extern void __CRAB_assert(int);

int a1[200] __attribute__ ((aligned (64)));
int a2[200] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));
int z __attribute__ ((aligned (64)));


void __CSIM_MAIN__()
{
    __CSIM_init_cache();

    z = 5;

    i = 0;
    a1[i] = 5;
    a2[i] = 5;

    i++;
    a1[i] = 5;
    a2[i] = 5;

    i++;
    a1[i] = 5;
    a2[i] = 5;

    i++;
    a1[i] = 5;
    a2[i] = 5;

    i++;
    a1[i] = 5;
    a2[i] = 5;


    i=0;
    if (i != z)
        a2[i] = a1[i];
    else
        a1[i] = a2[i];

    i++;
    if (i != z)
        a2[i] = a1[i];

    i++;
    if (i != z)
        a2[i] = a1[i];

    i++;
    if (i != z)
        a2[i] = a1[i];

    i++;
    if (i != z)
        a2[i] = a1[i];


    // omitted assertion check part. Instead, check cache variables

    __CRAB_assert(__CSIM_num_Store_hit > 1);      // [22, 22]
    __CRAB_assert(__CSIM_num_Store_miss > 1);     // [4, 4]
    __CRAB_assert(__CSIM_num_Load_hit > 1);       // [43, 43]
    __CRAB_assert(__CSIM_num_Load_miss > 1);      // [0, 0]

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

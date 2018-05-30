/*
 * Date: 2018. 03. 28.
 * Author: Chungha Sung (chunghas@usc.edu)
 * The code has been changed to test CacheSim.
 * The original code is from SV-COMP repository (https://github.com/sosy-lab/sv-benchmarks)
 * The file name is c/bitvector/gcd_1_true-unreach-call_true-no-overflow.c
 */

//extern void VERIFIER_error() __attribute__ ((__noreturn__));

extern char __VERIFIER_nondet_char(void);
extern void __CRAB_assert(int);

/*
void __VERIFIER_assert(int cond) {
    if (!(cond)) {
        ERROR: __VERIFIER_error();
    }
    return;
}
*/

// inlined
/*
signed char gcd_test(signed char a, signed char b)
{
    signed char t;

    if (a < 0) a = -a;
    if (b < 0) b = -b;

    while (b != 0) {
        t = b;
        b = a % b;
        a = t;
    }
    return a;
}
*/

signed char x __attribute__ ((aligned (64)));
signed char y __attribute__ ((aligned (64)));
signed char t __attribute__ ((aligned (64)));


void __CSIM_MAIN__()
{
    __CSIM_init_cache();

    x = __VERIFIER_nondet_char();
    y = __VERIFIER_nondet_char();

    if (y > 0 && x % y == 0) {
        //g = gcd_test(x, y);
        if (x < 0) x = -x;
        if (y < 0) y = -y;
        
        // unroll 4 times

        if (y != 0) {

            t = y;
            y = x % y;
            x = t;

            if (y != 0) {

                t = y;
                y = x % y;
                x = t;

                if (y != 0) {

                    t = y;
                    y = x % y;
                    x = t;

                    if (y != 0) {

                        t = y;
                        y = x % y;
                        x = t;

                    }
                }
            }
        }

        // omitted assertion check part. Instead, check cache variables.

        __CRAB_assert(__CSIM_num_Store_hit > 1);     // [0, 13]
        __CRAB_assert(__CSIM_num_Store_miss > 1);    // [2, 3]
        __CRAB_assert(__CSIM_num_Load_hit > 1);      // [6, 27]
        __CRAB_assert(__CSIM_num_Load_miss > 1);     // [0, 0]

        //__VERIFIER_assert(g == y);
    }
}


int main()
{
    __CSIM_MAIN__();
    return 0;
}

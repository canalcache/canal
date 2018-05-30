/* 
 * Date: 2018. 03. 28.
 * Author: Chungha Sung (chunghas@usc.edu)
 * The code has been changed to test CacheSim.
 * The original code is from SV-COMP repository (https://github.com/sosy-lab/sv-benchmarks)
 * The file name is c/array-examples/sanfoundry_02_true-unreach-call_ground.c
 */

//extern void __VERIFIER_error() __attribute__ ((__noreturn__));
//void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: __VERIFIER_error(); } }

/*
 * Adapted from http://www.sanfoundry.com/c-programming-examples-arrays/
 * C program to read in four integer numbers into an array and find the
 * average of largest two of the given numbers without sorting the array.
 * The program should output the given four numbers and the average.
 */

extern int nd();
extern void __CRAB_assert(int);

#define MAX 5

int array[200] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));
int largest1 __attribute__ ((aligned (64)));
int largest2 __attribute__ ((aligned (64)));
int temp __attribute__ ((aligned (64)));

void __CSIM_MAIN__()
{
    __CSIM_init_cache();

    /*  assume first element of array is the first larges t*/
    largest1 = array[0];
    /*  assume first element of array is the second largest */
    largest2 = array[1];

    if (largest1 < largest2)
    {
        temp = largest1;
        largest1 = largest2;
        largest2 = temp;
    }

    // unrolled

    i = 0;
    if (i < 5) {
        if (nd())
        {
            largest2 = largest1;
            largest1 = array[i];
        }
        //else if (array[i] > largest2)
        else if (nd())
        {
            //largest2 = array[i];
            largest2 = array[i*16];
        }

        i++;

        if (i < 5) {
            if (nd())
            {
                largest2 = largest1;
                largest1 = array[i];
            }
            //else if (array[i] > largest2)
            else if (nd())
            {
                //largest2 = array[i];
                largest2 = array[i*16];
            }

            i++;

            if (i < 5) {
                if (nd())
                {
                    largest2 = largest1;
                    largest1 = array[i];
                }
                //else if (array[i] > largest2)
                else if (nd())
                {
                    //largest2 = array[i];
                    largest2 = array[i*16];
                }

                i++;

                if (i < 5) {
                    if (nd())
                    {
                        largest2 = largest1;
                        largest1 = array[i];
                    }
                    //else if (array[i] > largest2)
                    else if (nd())
                    {
                        //largest2 = array[i];
                        largest2 = array[i*16];
                    }

                    i++;

                    if (i < 5) {

                        if (nd())
                        {
                            largest2 = largest1;
                            largest1 = array[i];
                        }
                        //else if (array[i] > largest2)
                        else if (nd())
                        {
                            //largest2 = array[i];
                            largest2 = array[i*16];
                        }

                        i++;

                        if (i < 5) {
                            if (nd())
                            {
                                largest2 = largest1;
                                largest1 = array[i];
                            }
                            //else if (array[i] > largest2)
                            else if (nd())
                            {
                                //largest2 = array[i];
                                largest2 = array[i*16];
                            }
                        }
                    }
                }
            }
        }
    }

    // omitted checking assertion part. Instead, inserted assert check for cache variables

    __CRAB_assert(__CSIM_num_Store > 1); // [8, 18]
    __CRAB_assert(__CSIM_num_Store_hit > 1);    // [5, 15]
    __CRAB_assert(__CSIM_num_Store_miss > 1);   // [3, 3]
    __CRAB_assert(__CSIM_num_Load > 1);  // [15, 30]
    __CRAB_assert(__CSIM_num_Load_hit > 1);     // [14, 29]
    __CRAB_assert(__CSIM_num_Load_miss > 1);    // [1, 5]

    /*
    int x;
    for( x = 0 ; x < MAX ; x++ ) {
        __VERIFIER_assert(  array[ x ] <= largest1  );
    }
    for( x = 0 ; x < MAX ; x++ ) {
        __VERIFIER_assert(  array[x] <= largest2 || array[x] == largest1  );
    }
    */
}

int main()
{
    __CSIM_MAIN__();
    return 0;
}

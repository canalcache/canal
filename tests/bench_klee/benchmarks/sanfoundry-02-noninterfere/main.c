#include "klee/klee.h"
#include <assert.h>
/*
 * Adapted from http://www.sanfoundry.com/c-programming-examples-arrays/
 * C program to read in four integer numbers into an array and find the
 * average of largest two of the given numbers without sorting the array.
 * The program should output the given four numbers and the average.
 */

#define SIZE 4
int array[SIZE] __attribute__ ((aligned (64)));
int i __attribute__ ((aligned (64)));
int largest1 __attribute__ ((aligned (64)));
int largest2 __attribute__ ((aligned (64)));
int temp __attribute__ ((aligned (64)));

int __CSIM_MAIN__(int a, int b, int c, int d)
{
	array[0] = a;
	array[1] = b;
	array[2] = c;
	array[3] = d;
 
    /*  assume first element of array is the first larges t*/
    largest1 = array[0];
    /*  assume first element of array is the second largest */
    largest2 = array[1];

    if (largest1 < largest2)
    {
        temp = largest1;
        largest1 = largest2;
        largest2 = temp;
    } else {
        temp = largest1;
        largest1 = largest2;
        largest2 = temp;
	}

    for (i = 2; i < SIZE;  i++)
    {
        if (array[i] >= largest1)
        {
			largest2 = array[i];
            largest2 = array[i];

            largest2 = largest1;
            largest1 = array[i];
        }
        else if (array[i] > largest2)
        {
            largest2 = largest1;
			temp = array[i];
            largest2 = array[i];
        } else {
			temp = array[i];
			temp = array[i];
			temp = largest2;
		}
    }
    
  return 0;
}

int a1, a2, b1, b2, c1, c2, d1, d2 __attribute__ ((aligned (64)));

int main() {
	unsigned int access1, miss1, access2, miss2;
    klee_make_symbolic(&a1, sizeof(int), "a1");
    klee_make_symbolic(&b1, sizeof(int), "b1");
    klee_make_symbolic(&c1, sizeof(int), "c1");
    klee_make_symbolic(&d1, sizeof(int), "d1");
    klee_make_symbolic(&a2, sizeof(int), "a2");
    klee_make_symbolic(&b2, sizeof(int), "b2");
    klee_make_symbolic(&c2, sizeof(int), "c2");
    klee_make_symbolic(&d2, sizeof(int), "d2");
    klee_assume(a1 != a2);	
    klee_assume(b1 != b2);	
    klee_assume(c1 != c2);	
    klee_assume(d1 != d2);	

    __CSIM_init_cache();
    __CSIM_MAIN__(a1, b1, c1, d1);
	access1 = __CSIM_num;
	miss1 = __CSIM_num_Store_miss + __CSIM_num_Load_miss;


    __CSIM_init_cache();
    __CSIM_MAIN__(a2, b2, c2, d2);
	access2 = __CSIM_num;
	miss2 = __CSIM_num_Store_miss + __CSIM_num_Load_miss;

	assert(access1 == access2);
	assert(miss1 == miss2);
    return 0;
}

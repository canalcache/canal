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
    }

    for (i = 2; i < SIZE;  i++)
    {
        if (array[i] >= largest1)
        {
            largest2 = largest1;
            largest1 = array[i];
        }
        else if (array[i] > largest2)
        {
            largest2 = array[i];
        }
    }
    
  return 0;
}

int a1, a2, b1, b2, c1, c2, d1, d2 __attribute__ ((aligned (64)));

int main() {
    __CSIM_MAIN__(a1, b1, c1, d1);

    __CSIM_MAIN__(a2, b2, c2, d2);

    return 0;
}

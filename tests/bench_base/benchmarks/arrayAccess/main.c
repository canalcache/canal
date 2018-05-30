#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

// In here, I used 16384 as standard for full cold cache
// since (index is 13 bits) + (8-way is 3 bits) - (move by 4 bytes which is 2 bits) = 14 bits
// at least 2^14 = 16384 size of array is needed to fill the cache fully.

#define ArrLength 9216

int i __attribute__((aligned (64)));
int test_array[ArrLength] __attribute__ ((aligned (64)));

void __CSIM_MAIN__() {


    // init_stat
    __CSIM_init_stat();

    for (i=0&i; i<ArrLength; i++) {
        //test_array[i] = 1;
        test_array[i] = test_array[i] & 0;
        //test_array[i] = test_array[i] & 0;
        //unsigned int addr = (uintptr_t)&test_array[i];
        //printf("address: %u\n", addr);
    }

    for (i=0&i; i<ArrLength; i++) {
        //test_array[i] = 1;
        test_array[i] = test_array[i] & 0;
        //test_array[i] = test_array[i] & 0;
        //unsigned int addr = (uintptr_t)&test_array[i];
        //printf("address: %u\n", addr);
    }

    for (i=0&i; i<ArrLength; i++) {
        //test_array[i] = 1;
        test_array[i] = test_array[i] & 0;
        //test_array[i] = test_array[i] & 0;
        //unsigned int addr = (uintptr_t)&test_array[i];
        //printf("address: %u\n", addr);
    }

    for (i=0&i; i<ArrLength; i++) {
        //test_array[i] = 1;
        test_array[i] = test_array[i] & 0;
        //test_array[i] = test_array[i] & 0;
        //unsigned int addr = (uintptr_t)&test_array[i];
        //printf("address: %u\n", addr);
    }

    for (i=0&i; i<ArrLength; i++) {
        //test_array[i] = 1;
        test_array[i] = test_array[i] & 0;
        //test_array[i] = test_array[i] & 0;
        //unsigned int addr = (uintptr_t)&test_array[i];
        //printf("address: %u\n", addr);
    }

    __CSIM_print_stat();
}

int main () {

    __CSIM_init_cache();

    __CSIM_MAIN__();

    return 0;
}

/****************************************************************/
/* Cache specification (Byte address) */
/* Cache total size: 1 KB */
/* Cache ways of associativity: 4 */
/* Cache line size: 64 B */
/*  [ Tags (56 bits) | Set (2 bits) | Offset (6 bits) ] */
/* Eviction policy: LRU */
/****************************************************************/
#define BITS 64
#define TAG_BIT 56
#define SET_BIT 2
#define OFFSET_BIT 6
#define WAY_BIT 2
#define SET_OFFSET_BIT 8
#define SET_NUM 4
#define OFFSET_NUM 64
#define SET_OFFSET_NUM 256
#define WAY_NUM 4
#define TOTAL_LENGTH 16

#define __CSIM_addr_t unsigned long long

#include <limits.h>
#include <stdio.h>
#include <stdbool.h>

#define DEBUG false

#define __CSIM_CACHE_HIT true
#define __CSIM_CACHE_MISS false
#define __CSIM_CACHE_RET bool

unsigned int __CSIM_num;
unsigned int __CSIM_num_Load;
unsigned int __CSIM_num_Store;

unsigned int __CSIM_num_hit;
unsigned int __CSIM_num_miss;
unsigned int __CSIM_num_Load_hit;
unsigned int __CSIM_num_Load_miss;
unsigned int __CSIM_num_Store_hit;
unsigned int __CSIM_num_Store_miss;
__CSIM_CACHE_RET __CSIM_Load_ret;
__CSIM_CACHE_RET __CSIM_Store_ret;

__CSIM_addr_t __CSIM_cLine00_tags, __CSIM_cLine01_tags, __CSIM_cLine02_tags, __CSIM_cLine03_tags;
__CSIM_addr_t __CSIM_cLine10_tags, __CSIM_cLine11_tags, __CSIM_cLine12_tags, __CSIM_cLine13_tags;
__CSIM_addr_t __CSIM_cLine20_tags, __CSIM_cLine21_tags, __CSIM_cLine22_tags, __CSIM_cLine23_tags;
__CSIM_addr_t __CSIM_cLine30_tags, __CSIM_cLine31_tags, __CSIM_cLine32_tags, __CSIM_cLine33_tags;
__CSIM_addr_t __CSIM_cLine00_rank, __CSIM_cLine01_rank, __CSIM_cLine02_rank, __CSIM_cLine03_rank;
__CSIM_addr_t __CSIM_cLine10_rank, __CSIM_cLine11_rank, __CSIM_cLine12_rank, __CSIM_cLine13_rank;
__CSIM_addr_t __CSIM_cLine20_rank, __CSIM_cLine21_rank, __CSIM_cLine22_rank, __CSIM_cLine23_rank;
__CSIM_addr_t __CSIM_cLine30_rank, __CSIM_cLine31_rank, __CSIM_cLine32_rank, __CSIM_cLine33_rank;
bool __CSIM_cLine00_taken, __CSIM_cLine01_taken, __CSIM_cLine02_taken, __CSIM_cLine03_taken;
bool __CSIM_cLine10_taken, __CSIM_cLine11_taken, __CSIM_cLine12_taken, __CSIM_cLine13_taken;
bool __CSIM_cLine20_taken, __CSIM_cLine21_taken, __CSIM_cLine22_taken, __CSIM_cLine23_taken;
bool __CSIM_cLine30_taken, __CSIM_cLine31_taken, __CSIM_cLine32_taken, __CSIM_cLine33_taken;
bool __CSIM_cLine00_dirty, __CSIM_cLine01_dirty, __CSIM_cLine02_dirty, __CSIM_cLine03_dirty;
bool __CSIM_cLine10_dirty, __CSIM_cLine11_dirty, __CSIM_cLine12_dirty, __CSIM_cLine13_dirty;
bool __CSIM_cLine20_dirty, __CSIM_cLine21_dirty, __CSIM_cLine22_dirty, __CSIM_cLine23_dirty;
bool __CSIM_cLine30_dirty, __CSIM_cLine31_dirty, __CSIM_cLine32_dirty, __CSIM_cLine33_dirty;

void __CSIM_init_stat (void)
{
    __CSIM_num = 0;
    __CSIM_num_Load = 0;
    __CSIM_num_Store = 0;

    __CSIM_num_hit = 0;
    __CSIM_num_miss = 0;
    __CSIM_num_Load_hit = 0;
    __CSIM_num_Load_miss = 0;
    __CSIM_num_Store_hit = 0;
    __CSIM_num_Store_miss = 0;

    __CSIM_Load_ret = false;
    __CSIM_Store_ret = false;

#if DEBUG
    printf("-----------------------------\n");
    printf("Stats are initialized\n");
    printf("-----------------------------\n");
#endif


}
void __CSIM_init_cache (void)
{
    __CSIM_num = 0;
    __CSIM_num_Load = 0;
    __CSIM_num_Store = 0;

    __CSIM_num_hit = 0;
    __CSIM_num_miss = 0;
    __CSIM_num_Load_hit = 0;
    __CSIM_num_Load_miss = 0;
    __CSIM_num_Store_hit = 0;
    __CSIM_num_Store_miss = 0;

    __CSIM_Load_ret = false;
    __CSIM_Store_ret = false;
    
    __CSIM_cLine00_tags=0, __CSIM_cLine01_tags=0, __CSIM_cLine02_tags=0, __CSIM_cLine03_tags=0;
    __CSIM_cLine10_tags=0, __CSIM_cLine11_tags=0, __CSIM_cLine12_tags=0, __CSIM_cLine13_tags=0;
    __CSIM_cLine20_tags=0, __CSIM_cLine21_tags=0, __CSIM_cLine22_tags=0, __CSIM_cLine23_tags=0;
    __CSIM_cLine30_tags=0, __CSIM_cLine31_tags=0, __CSIM_cLine32_tags=0, __CSIM_cLine33_tags=0;
    __CSIM_cLine00_rank=0, __CSIM_cLine01_rank=0, __CSIM_cLine02_rank=0, __CSIM_cLine03_rank=0;
    __CSIM_cLine10_rank=0, __CSIM_cLine11_rank=0, __CSIM_cLine12_rank=0, __CSIM_cLine13_rank=0;
    __CSIM_cLine20_rank=0, __CSIM_cLine21_rank=0, __CSIM_cLine22_rank=0, __CSIM_cLine23_rank=0;
    __CSIM_cLine30_rank=0, __CSIM_cLine31_rank=0, __CSIM_cLine32_rank=0, __CSIM_cLine33_rank=0;
    __CSIM_cLine00_taken=false, __CSIM_cLine01_taken=false, __CSIM_cLine02_taken=false, __CSIM_cLine03_taken=false;
    __CSIM_cLine10_taken=false, __CSIM_cLine11_taken=false, __CSIM_cLine12_taken=false, __CSIM_cLine13_taken=false;
    __CSIM_cLine20_taken=false, __CSIM_cLine21_taken=false, __CSIM_cLine22_taken=false, __CSIM_cLine23_taken=false;
    __CSIM_cLine30_taken=false, __CSIM_cLine31_taken=false, __CSIM_cLine32_taken=false, __CSIM_cLine33_taken=false;
    __CSIM_cLine00_dirty=false, __CSIM_cLine01_dirty=false, __CSIM_cLine02_dirty=false, __CSIM_cLine03_dirty=false;
    __CSIM_cLine10_dirty=false, __CSIM_cLine11_dirty=false, __CSIM_cLine12_dirty=false, __CSIM_cLine13_dirty=false;
    __CSIM_cLine20_dirty=false, __CSIM_cLine21_dirty=false, __CSIM_cLine22_dirty=false, __CSIM_cLine23_dirty=false;
    __CSIM_cLine30_dirty=false, __CSIM_cLine31_dirty=false, __CSIM_cLine32_dirty=false, __CSIM_cLine33_dirty=false;

    printf("SET_NUM: %d\n", SET_NUM);
    printf("OFFSET_NUM: %d\n", OFFSET_NUM);
    printf("WAY_NUM: %d\n", WAY_NUM);
    printf("Total Length: %d\n", TOTAL_LENGTH);
}

void __CSIM_Load(__CSIM_addr_t tags, __CSIM_addr_t set) { 
    /* Function: get_set */
    /* [ tags | set | offset ] -> [ 0 | 0 | set ] */
    /* Same as (tags << SET_OFFSET_BIT)*/

    /* incremet __CSIM_num and __CSIM_num_Load */ 
    __CSIM_num++;
    __CSIM_num_Load++; 
    /* check whether there is an element with the same tags*/
        #if DEBUG
        printf("-----------------------------\n"); 
        printf("Load!\n"); 
        //printf("Tags: %llu\n", tags); 
        //printf("Set: %llu\n", set); 
        #endif
    if (set == 0) {
        __CSIM_cLine00_rank++;
        __CSIM_cLine01_rank++;
        __CSIM_cLine02_rank++;
        __CSIM_cLine03_rank++;
        /* check match tag for way 0. */ 
        if (__CSIM_cLine00_taken && __CSIM_cLine00_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 0);
            #endif
            __CSIM_cLine00_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 1. */ 
        else if (__CSIM_cLine01_taken && __CSIM_cLine01_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 1);
            #endif
            __CSIM_cLine01_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 2. */ 
        else if (__CSIM_cLine02_taken && __CSIM_cLine02_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 2);
            #endif
            __CSIM_cLine02_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 3. */ 
        else if (__CSIM_cLine03_taken && __CSIM_cLine03_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 3);
            #endif
            __CSIM_cLine03_rank = 0;
             __CSIM_Load_ret = true;
        }
        else {
            /* If nothing has been matched, it is miss */
            #if DEBUG
            printf("Cache miss!\n");
            #endif
            __CSIM_num_Load_miss++;
             __CSIM_Load_ret = false;
            /* Cold miss check */
            if (!__CSIM_cLine00_taken) {
                __CSIM_cLine00_taken = true;
                __CSIM_cLine00_tags = tags;
                __CSIM_cLine00_rank = 0;
            }
            else if (!__CSIM_cLine01_taken) {
                __CSIM_cLine01_taken = true;
                __CSIM_cLine01_tags = tags;
                __CSIM_cLine01_rank = 0;
            }
            else if (!__CSIM_cLine02_taken) {
                __CSIM_cLine02_taken = true;
                __CSIM_cLine02_tags = tags;
                __CSIM_cLine02_rank = 0;
            }
            else if (!__CSIM_cLine03_taken) {
                __CSIM_cLine03_taken = true;
                __CSIM_cLine03_tags = tags;
                __CSIM_cLine03_rank = 0;
            }
            else {
             /* Pick the highest rank */
               if (__CSIM_cLine00_rank >= __CSIM_cLine01_rank && __CSIM_cLine00_rank >= __CSIM_cLine02_rank && __CSIM_cLine00_rank >= __CSIM_cLine03_rank) {
                    __CSIM_cLine00_rank = 0;
                    __CSIM_cLine00_tags = tags;
                }
               else if (__CSIM_cLine01_rank >= __CSIM_cLine00_rank && __CSIM_cLine01_rank >= __CSIM_cLine02_rank && __CSIM_cLine01_rank >= __CSIM_cLine03_rank) {
                    __CSIM_cLine01_rank = 0;
                    __CSIM_cLine01_tags = tags;
                }
               else if (__CSIM_cLine02_rank >= __CSIM_cLine00_rank && __CSIM_cLine02_rank >= __CSIM_cLine01_rank && __CSIM_cLine02_rank >= __CSIM_cLine03_rank) {
                    __CSIM_cLine02_rank = 0;
                    __CSIM_cLine02_tags = tags;
                }
               else if (__CSIM_cLine03_rank >= __CSIM_cLine00_rank && __CSIM_cLine03_rank >= __CSIM_cLine01_rank && __CSIM_cLine03_rank >= __CSIM_cLine02_rank) {
                    __CSIM_cLine03_rank = 0;
                    __CSIM_cLine03_tags = tags;
                }
            }
        }
    }
    else if (set == 1) {
        __CSIM_cLine10_rank++;
        __CSIM_cLine11_rank++;
        __CSIM_cLine12_rank++;
        __CSIM_cLine13_rank++;
        /* check match tag for way 0. */ 
        if (__CSIM_cLine10_taken && __CSIM_cLine10_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 0);
            #endif
            __CSIM_cLine10_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 1. */ 
        else if (__CSIM_cLine11_taken && __CSIM_cLine11_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 1);
            #endif
            __CSIM_cLine11_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 2. */ 
        else if (__CSIM_cLine12_taken && __CSIM_cLine12_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 2);
            #endif
            __CSIM_cLine12_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 3. */ 
        else if (__CSIM_cLine13_taken && __CSIM_cLine13_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 3);
            #endif
            __CSIM_cLine13_rank = 0;
             __CSIM_Load_ret = true;
        }
        else {
            /* If nothing has been matched, it is miss */
            #if DEBUG
            printf("Cache miss!\n");
            #endif
            __CSIM_num_Load_miss++;
             __CSIM_Load_ret = false;
            /* Cold miss check */
            if (!__CSIM_cLine10_taken) {
                __CSIM_cLine10_taken = true;
                __CSIM_cLine10_tags = tags;
                __CSIM_cLine10_rank = 0;
            }
            else if (!__CSIM_cLine11_taken) {
                __CSIM_cLine11_taken = true;
                __CSIM_cLine11_tags = tags;
                __CSIM_cLine11_rank = 0;
            }
            else if (!__CSIM_cLine12_taken) {
                __CSIM_cLine12_taken = true;
                __CSIM_cLine12_tags = tags;
                __CSIM_cLine12_rank = 0;
            }
            else if (!__CSIM_cLine13_taken) {
                __CSIM_cLine13_taken = true;
                __CSIM_cLine13_tags = tags;
                __CSIM_cLine13_rank = 0;
            }
            else {
             /* Pick the highest rank */
               if (__CSIM_cLine10_rank >= __CSIM_cLine11_rank && __CSIM_cLine10_rank >= __CSIM_cLine12_rank && __CSIM_cLine10_rank >= __CSIM_cLine13_rank) {
                    __CSIM_cLine10_rank = 0;
                    __CSIM_cLine10_tags = tags;
                }
               else if (__CSIM_cLine11_rank >= __CSIM_cLine10_rank && __CSIM_cLine11_rank >= __CSIM_cLine12_rank && __CSIM_cLine11_rank >= __CSIM_cLine13_rank) {
                    __CSIM_cLine11_rank = 0;
                    __CSIM_cLine11_tags = tags;
                }
               else if (__CSIM_cLine12_rank >= __CSIM_cLine10_rank && __CSIM_cLine12_rank >= __CSIM_cLine11_rank && __CSIM_cLine12_rank >= __CSIM_cLine13_rank) {
                    __CSIM_cLine12_rank = 0;
                    __CSIM_cLine12_tags = tags;
                }
               else if (__CSIM_cLine13_rank >= __CSIM_cLine10_rank && __CSIM_cLine13_rank >= __CSIM_cLine11_rank && __CSIM_cLine13_rank >= __CSIM_cLine12_rank) {
                    __CSIM_cLine13_rank = 0;
                    __CSIM_cLine13_tags = tags;
                }
            }
        }
    }
    else if (set == 2) {
        __CSIM_cLine20_rank++;
        __CSIM_cLine21_rank++;
        __CSIM_cLine22_rank++;
        __CSIM_cLine23_rank++;
        /* check match tag for way 0. */ 
        if (__CSIM_cLine20_taken && __CSIM_cLine20_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 0);
            #endif
            __CSIM_cLine20_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 1. */ 
        else if (__CSIM_cLine21_taken && __CSIM_cLine21_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 1);
            #endif
            __CSIM_cLine21_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 2. */ 
        else if (__CSIM_cLine22_taken && __CSIM_cLine22_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 2);
            #endif
            __CSIM_cLine22_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 3. */ 
        else if (__CSIM_cLine23_taken && __CSIM_cLine23_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 3);
            #endif
            __CSIM_cLine23_rank = 0;
             __CSIM_Load_ret = true;
        }
        else {
            /* If nothing has been matched, it is miss */
            #if DEBUG
            printf("Cache miss!\n");
            #endif
            __CSIM_num_Load_miss++;
             __CSIM_Load_ret = false;
            /* Cold miss check */
            if (!__CSIM_cLine20_taken) {
                __CSIM_cLine20_taken = true;
                __CSIM_cLine20_tags = tags;
                __CSIM_cLine20_rank = 0;
            }
            else if (!__CSIM_cLine21_taken) {
                __CSIM_cLine21_taken = true;
                __CSIM_cLine21_tags = tags;
                __CSIM_cLine21_rank = 0;
            }
            else if (!__CSIM_cLine22_taken) {
                __CSIM_cLine22_taken = true;
                __CSIM_cLine22_tags = tags;
                __CSIM_cLine22_rank = 0;
            }
            else if (!__CSIM_cLine23_taken) {
                __CSIM_cLine23_taken = true;
                __CSIM_cLine23_tags = tags;
                __CSIM_cLine23_rank = 0;
            }
            else {
             /* Pick the highest rank */
               if (__CSIM_cLine20_rank >= __CSIM_cLine21_rank && __CSIM_cLine20_rank >= __CSIM_cLine22_rank && __CSIM_cLine20_rank >= __CSIM_cLine23_rank) {
                    __CSIM_cLine20_rank = 0;
                    __CSIM_cLine20_tags = tags;
                }
               else if (__CSIM_cLine21_rank >= __CSIM_cLine20_rank && __CSIM_cLine21_rank >= __CSIM_cLine22_rank && __CSIM_cLine21_rank >= __CSIM_cLine23_rank) {
                    __CSIM_cLine21_rank = 0;
                    __CSIM_cLine21_tags = tags;
                }
               else if (__CSIM_cLine22_rank >= __CSIM_cLine20_rank && __CSIM_cLine22_rank >= __CSIM_cLine21_rank && __CSIM_cLine22_rank >= __CSIM_cLine23_rank) {
                    __CSIM_cLine22_rank = 0;
                    __CSIM_cLine22_tags = tags;
                }
               else if (__CSIM_cLine23_rank >= __CSIM_cLine20_rank && __CSIM_cLine23_rank >= __CSIM_cLine21_rank && __CSIM_cLine23_rank >= __CSIM_cLine22_rank) {
                    __CSIM_cLine23_rank = 0;
                    __CSIM_cLine23_tags = tags;
                }
            }
        }
    }
    else if (set == 3) {
        __CSIM_cLine30_rank++;
        __CSIM_cLine31_rank++;
        __CSIM_cLine32_rank++;
        __CSIM_cLine33_rank++;
        /* check match tag for way 0. */ 
        if (__CSIM_cLine30_taken && __CSIM_cLine30_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 0);
            #endif
            __CSIM_cLine30_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 1. */ 
        else if (__CSIM_cLine31_taken && __CSIM_cLine31_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 1);
            #endif
            __CSIM_cLine31_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 2. */ 
        else if (__CSIM_cLine32_taken && __CSIM_cLine32_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 2);
            #endif
            __CSIM_cLine32_rank = 0;
             __CSIM_Load_ret = true;
        }
        /* check match tag for way 3. */ 
        else if (__CSIM_cLine33_taken && __CSIM_cLine33_tags == tags) {
            __CSIM_num_Load_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 3);
            #endif
            __CSIM_cLine33_rank = 0;
             __CSIM_Load_ret = true;
        }
        else {
            /* If nothing has been matched, it is miss */
            #if DEBUG
            printf("Cache miss!\n");
            #endif
            __CSIM_num_Load_miss++;
             __CSIM_Load_ret = false;
            /* Cold miss check */
            if (!__CSIM_cLine30_taken) {
                __CSIM_cLine30_taken = true;
                __CSIM_cLine30_tags = tags;
                __CSIM_cLine30_rank = 0;
            }
            else if (!__CSIM_cLine31_taken) {
                __CSIM_cLine31_taken = true;
                __CSIM_cLine31_tags = tags;
                __CSIM_cLine31_rank = 0;
            }
            else if (!__CSIM_cLine32_taken) {
                __CSIM_cLine32_taken = true;
                __CSIM_cLine32_tags = tags;
                __CSIM_cLine32_rank = 0;
            }
            else if (!__CSIM_cLine33_taken) {
                __CSIM_cLine33_taken = true;
                __CSIM_cLine33_tags = tags;
                __CSIM_cLine33_rank = 0;
            }
            else {
             /* Pick the highest rank */
               if (__CSIM_cLine30_rank >= __CSIM_cLine31_rank && __CSIM_cLine30_rank >= __CSIM_cLine32_rank && __CSIM_cLine30_rank >= __CSIM_cLine33_rank) {
                    __CSIM_cLine30_rank = 0;
                    __CSIM_cLine30_tags = tags;
                }
               else if (__CSIM_cLine31_rank >= __CSIM_cLine30_rank && __CSIM_cLine31_rank >= __CSIM_cLine32_rank && __CSIM_cLine31_rank >= __CSIM_cLine33_rank) {
                    __CSIM_cLine31_rank = 0;
                    __CSIM_cLine31_tags = tags;
                }
               else if (__CSIM_cLine32_rank >= __CSIM_cLine30_rank && __CSIM_cLine32_rank >= __CSIM_cLine31_rank && __CSIM_cLine32_rank >= __CSIM_cLine33_rank) {
                    __CSIM_cLine32_rank = 0;
                    __CSIM_cLine32_tags = tags;
                }
               else if (__CSIM_cLine33_rank >= __CSIM_cLine30_rank && __CSIM_cLine33_rank >= __CSIM_cLine31_rank && __CSIM_cLine33_rank >= __CSIM_cLine32_rank) {
                    __CSIM_cLine33_rank = 0;
                    __CSIM_cLine33_tags = tags;
                }
            }
        }
    }
}

void __CSIM_Store(__CSIM_addr_t tags, __CSIM_addr_t set) { 
    /* Function: get_set */
    /* [ tags | set | offset ] -> [ 0 | 0 | set ] */
    /* Same as (tags << SET_OFFSET_BIT)*/

    /* incremet __CSIM_num and __CSIM_num_Store */ 
    __CSIM_num++;
    __CSIM_num_Store++; 
    /* check whether there is an element with the same tags*/
        #if DEBUG
        printf("-----------------------------\n"); 
        printf("Store!\n"); 
        //printf("Tags: %llu\n", tags); 
        //printf("Set: %llu\n", set); 
        #endif
    if (set == 0) {
        __CSIM_cLine00_rank++;
        __CSIM_cLine01_rank++;
        __CSIM_cLine02_rank++;
        __CSIM_cLine03_rank++;
        /* check match tag for way 0. */ 
        if (__CSIM_cLine00_taken && __CSIM_cLine00_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 0);
            #endif
            __CSIM_cLine00_rank = 0;
            __CSIM_cLine00_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 1. */ 
        else if (__CSIM_cLine01_taken && __CSIM_cLine01_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 1);
            #endif
            __CSIM_cLine01_rank = 0;
            __CSIM_cLine01_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 2. */ 
        else if (__CSIM_cLine02_taken && __CSIM_cLine02_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 2);
            #endif
            __CSIM_cLine02_rank = 0;
            __CSIM_cLine02_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 3. */ 
        else if (__CSIM_cLine03_taken && __CSIM_cLine03_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 3);
            #endif
            __CSIM_cLine03_rank = 0;
            __CSIM_cLine03_dirty = true;
             __CSIM_Store_ret = true;
        }
        else {
            /* If nothing has been matched, it is miss */
            #if DEBUG
            printf("Cache miss!\n");
            #endif
            __CSIM_num_Store_miss++;
             __CSIM_Store_ret = false;
            /* Cold miss check */
            if (!__CSIM_cLine00_taken) {
                __CSIM_cLine00_taken = true;
                __CSIM_cLine00_tags = tags;
                __CSIM_cLine00_rank = 0;
                __CSIM_cLine00_dirty = true;
            }
            else if (!__CSIM_cLine01_taken) {
                __CSIM_cLine01_taken = true;
                __CSIM_cLine01_tags = tags;
                __CSIM_cLine01_rank = 0;
                __CSIM_cLine01_dirty = true;
            }
            else if (!__CSIM_cLine02_taken) {
                __CSIM_cLine02_taken = true;
                __CSIM_cLine02_tags = tags;
                __CSIM_cLine02_rank = 0;
                __CSIM_cLine02_dirty = true;
            }
            else if (!__CSIM_cLine03_taken) {
                __CSIM_cLine03_taken = true;
                __CSIM_cLine03_tags = tags;
                __CSIM_cLine03_rank = 0;
                __CSIM_cLine03_dirty = true;
            }
            else {
             /* Pick the highest rank */
               if (__CSIM_cLine00_rank >= __CSIM_cLine01_rank && __CSIM_cLine00_rank >= __CSIM_cLine02_rank && __CSIM_cLine00_rank >= __CSIM_cLine03_rank) {
                    __CSIM_cLine00_rank = 0;
                    __CSIM_cLine00_tags = tags;
                    __CSIM_cLine00_dirty = true;
                }
               else if (__CSIM_cLine01_rank >= __CSIM_cLine00_rank && __CSIM_cLine01_rank >= __CSIM_cLine02_rank && __CSIM_cLine01_rank >= __CSIM_cLine03_rank) {
                    __CSIM_cLine01_rank = 0;
                    __CSIM_cLine01_tags = tags;
                    __CSIM_cLine01_dirty = true;
                }
               else if (__CSIM_cLine02_rank >= __CSIM_cLine00_rank && __CSIM_cLine02_rank >= __CSIM_cLine01_rank && __CSIM_cLine02_rank >= __CSIM_cLine03_rank) {
                    __CSIM_cLine02_rank = 0;
                    __CSIM_cLine02_tags = tags;
                    __CSIM_cLine02_dirty = true;
                }
               else if (__CSIM_cLine03_rank >= __CSIM_cLine00_rank && __CSIM_cLine03_rank >= __CSIM_cLine01_rank && __CSIM_cLine03_rank >= __CSIM_cLine02_rank) {
                    __CSIM_cLine03_rank = 0;
                    __CSIM_cLine03_tags = tags;
                    __CSIM_cLine03_dirty = true;
                }
            }
        }
    }
    else if (set == 1) {
        __CSIM_cLine10_rank++;
        __CSIM_cLine11_rank++;
        __CSIM_cLine12_rank++;
        __CSIM_cLine13_rank++;
        /* check match tag for way 0. */ 
        if (__CSIM_cLine10_taken && __CSIM_cLine10_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 0);
            #endif
            __CSIM_cLine10_rank = 0;
            __CSIM_cLine10_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 1. */ 
        else if (__CSIM_cLine11_taken && __CSIM_cLine11_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 1);
            #endif
            __CSIM_cLine11_rank = 0;
            __CSIM_cLine11_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 2. */ 
        else if (__CSIM_cLine12_taken && __CSIM_cLine12_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 2);
            #endif
            __CSIM_cLine12_rank = 0;
            __CSIM_cLine12_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 3. */ 
        else if (__CSIM_cLine13_taken && __CSIM_cLine13_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 3);
            #endif
            __CSIM_cLine13_rank = 0;
            __CSIM_cLine13_dirty = true;
             __CSIM_Store_ret = true;
        }
        else {
            /* If nothing has been matched, it is miss */
            #if DEBUG
            printf("Cache miss!\n");
            #endif
            __CSIM_num_Store_miss++;
             __CSIM_Store_ret = false;
            /* Cold miss check */
            if (!__CSIM_cLine10_taken) {
                __CSIM_cLine10_taken = true;
                __CSIM_cLine10_tags = tags;
                __CSIM_cLine10_rank = 0;
                __CSIM_cLine10_dirty = true;
            }
            else if (!__CSIM_cLine11_taken) {
                __CSIM_cLine11_taken = true;
                __CSIM_cLine11_tags = tags;
                __CSIM_cLine11_rank = 0;
                __CSIM_cLine11_dirty = true;
            }
            else if (!__CSIM_cLine12_taken) {
                __CSIM_cLine12_taken = true;
                __CSIM_cLine12_tags = tags;
                __CSIM_cLine12_rank = 0;
                __CSIM_cLine12_dirty = true;
            }
            else if (!__CSIM_cLine13_taken) {
                __CSIM_cLine13_taken = true;
                __CSIM_cLine13_tags = tags;
                __CSIM_cLine13_rank = 0;
                __CSIM_cLine13_dirty = true;
            }
            else {
             /* Pick the highest rank */
               if (__CSIM_cLine10_rank >= __CSIM_cLine11_rank && __CSIM_cLine10_rank >= __CSIM_cLine12_rank && __CSIM_cLine10_rank >= __CSIM_cLine13_rank) {
                    __CSIM_cLine10_rank = 0;
                    __CSIM_cLine10_tags = tags;
                    __CSIM_cLine10_dirty = true;
                }
               else if (__CSIM_cLine11_rank >= __CSIM_cLine10_rank && __CSIM_cLine11_rank >= __CSIM_cLine12_rank && __CSIM_cLine11_rank >= __CSIM_cLine13_rank) {
                    __CSIM_cLine11_rank = 0;
                    __CSIM_cLine11_tags = tags;
                    __CSIM_cLine11_dirty = true;
                }
               else if (__CSIM_cLine12_rank >= __CSIM_cLine10_rank && __CSIM_cLine12_rank >= __CSIM_cLine11_rank && __CSIM_cLine12_rank >= __CSIM_cLine13_rank) {
                    __CSIM_cLine12_rank = 0;
                    __CSIM_cLine12_tags = tags;
                    __CSIM_cLine12_dirty = true;
                }
               else if (__CSIM_cLine13_rank >= __CSIM_cLine10_rank && __CSIM_cLine13_rank >= __CSIM_cLine11_rank && __CSIM_cLine13_rank >= __CSIM_cLine12_rank) {
                    __CSIM_cLine13_rank = 0;
                    __CSIM_cLine13_tags = tags;
                    __CSIM_cLine13_dirty = true;
                }
            }
        }
    }
    else if (set == 2) {
        __CSIM_cLine20_rank++;
        __CSIM_cLine21_rank++;
        __CSIM_cLine22_rank++;
        __CSIM_cLine23_rank++;
        /* check match tag for way 0. */ 
        if (__CSIM_cLine20_taken && __CSIM_cLine20_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 0);
            #endif
            __CSIM_cLine20_rank = 0;
            __CSIM_cLine20_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 1. */ 
        else if (__CSIM_cLine21_taken && __CSIM_cLine21_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 1);
            #endif
            __CSIM_cLine21_rank = 0;
            __CSIM_cLine21_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 2. */ 
        else if (__CSIM_cLine22_taken && __CSIM_cLine22_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 2);
            #endif
            __CSIM_cLine22_rank = 0;
            __CSIM_cLine22_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 3. */ 
        else if (__CSIM_cLine23_taken && __CSIM_cLine23_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 3);
            #endif
            __CSIM_cLine23_rank = 0;
            __CSIM_cLine23_dirty = true;
             __CSIM_Store_ret = true;
        }
        else {
            /* If nothing has been matched, it is miss */
            #if DEBUG
            printf("Cache miss!\n");
            #endif
            __CSIM_num_Store_miss++;
             __CSIM_Store_ret = false;
            /* Cold miss check */
            if (!__CSIM_cLine20_taken) {
                __CSIM_cLine20_taken = true;
                __CSIM_cLine20_tags = tags;
                __CSIM_cLine20_rank = 0;
                __CSIM_cLine20_dirty = true;
            }
            else if (!__CSIM_cLine21_taken) {
                __CSIM_cLine21_taken = true;
                __CSIM_cLine21_tags = tags;
                __CSIM_cLine21_rank = 0;
                __CSIM_cLine21_dirty = true;
            }
            else if (!__CSIM_cLine22_taken) {
                __CSIM_cLine22_taken = true;
                __CSIM_cLine22_tags = tags;
                __CSIM_cLine22_rank = 0;
                __CSIM_cLine22_dirty = true;
            }
            else if (!__CSIM_cLine23_taken) {
                __CSIM_cLine23_taken = true;
                __CSIM_cLine23_tags = tags;
                __CSIM_cLine23_rank = 0;
                __CSIM_cLine23_dirty = true;
            }
            else {
             /* Pick the highest rank */
               if (__CSIM_cLine20_rank >= __CSIM_cLine21_rank && __CSIM_cLine20_rank >= __CSIM_cLine22_rank && __CSIM_cLine20_rank >= __CSIM_cLine23_rank) {
                    __CSIM_cLine20_rank = 0;
                    __CSIM_cLine20_tags = tags;
                    __CSIM_cLine20_dirty = true;
                }
               else if (__CSIM_cLine21_rank >= __CSIM_cLine20_rank && __CSIM_cLine21_rank >= __CSIM_cLine22_rank && __CSIM_cLine21_rank >= __CSIM_cLine23_rank) {
                    __CSIM_cLine21_rank = 0;
                    __CSIM_cLine21_tags = tags;
                    __CSIM_cLine21_dirty = true;
                }
               else if (__CSIM_cLine22_rank >= __CSIM_cLine20_rank && __CSIM_cLine22_rank >= __CSIM_cLine21_rank && __CSIM_cLine22_rank >= __CSIM_cLine23_rank) {
                    __CSIM_cLine22_rank = 0;
                    __CSIM_cLine22_tags = tags;
                    __CSIM_cLine22_dirty = true;
                }
               else if (__CSIM_cLine23_rank >= __CSIM_cLine20_rank && __CSIM_cLine23_rank >= __CSIM_cLine21_rank && __CSIM_cLine23_rank >= __CSIM_cLine22_rank) {
                    __CSIM_cLine23_rank = 0;
                    __CSIM_cLine23_tags = tags;
                    __CSIM_cLine23_dirty = true;
                }
            }
        }
    }
    else if (set == 3) {
        __CSIM_cLine30_rank++;
        __CSIM_cLine31_rank++;
        __CSIM_cLine32_rank++;
        __CSIM_cLine33_rank++;
        /* check match tag for way 0. */ 
        if (__CSIM_cLine30_taken && __CSIM_cLine30_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 0);
            #endif
            __CSIM_cLine30_rank = 0;
            __CSIM_cLine30_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 1. */ 
        else if (__CSIM_cLine31_taken && __CSIM_cLine31_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 1);
            #endif
            __CSIM_cLine31_rank = 0;
            __CSIM_cLine31_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 2. */ 
        else if (__CSIM_cLine32_taken && __CSIM_cLine32_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 2);
            #endif
            __CSIM_cLine32_rank = 0;
            __CSIM_cLine32_dirty = true;
             __CSIM_Store_ret = true;
        }
        /* check match tag for way 3. */ 
        else if (__CSIM_cLine33_taken && __CSIM_cLine33_tags == tags) {
            __CSIM_num_Store_hit++;
            #if DEBUG
            printf("Cache hit!\n");
            //printf("Way:%d\n", 3);
            #endif
            __CSIM_cLine33_rank = 0;
            __CSIM_cLine33_dirty = true;
             __CSIM_Store_ret = true;
        }
        else {
            /* If nothing has been matched, it is miss */
            #if DEBUG
            printf("Cache miss!\n");
            #endif
            __CSIM_num_Store_miss++;
             __CSIM_Store_ret = false;
            /* Cold miss check */
            if (!__CSIM_cLine30_taken) {
                __CSIM_cLine30_taken = true;
                __CSIM_cLine30_tags = tags;
                __CSIM_cLine30_rank = 0;
                __CSIM_cLine30_dirty = true;
            }
            else if (!__CSIM_cLine31_taken) {
                __CSIM_cLine31_taken = true;
                __CSIM_cLine31_tags = tags;
                __CSIM_cLine31_rank = 0;
                __CSIM_cLine31_dirty = true;
            }
            else if (!__CSIM_cLine32_taken) {
                __CSIM_cLine32_taken = true;
                __CSIM_cLine32_tags = tags;
                __CSIM_cLine32_rank = 0;
                __CSIM_cLine32_dirty = true;
            }
            else if (!__CSIM_cLine33_taken) {
                __CSIM_cLine33_taken = true;
                __CSIM_cLine33_tags = tags;
                __CSIM_cLine33_rank = 0;
                __CSIM_cLine33_dirty = true;
            }
            else {
             /* Pick the highest rank */
               if (__CSIM_cLine30_rank >= __CSIM_cLine31_rank && __CSIM_cLine30_rank >= __CSIM_cLine32_rank && __CSIM_cLine30_rank >= __CSIM_cLine33_rank) {
                    __CSIM_cLine30_rank = 0;
                    __CSIM_cLine30_tags = tags;
                    __CSIM_cLine30_dirty = true;
                }
               else if (__CSIM_cLine31_rank >= __CSIM_cLine30_rank && __CSIM_cLine31_rank >= __CSIM_cLine32_rank && __CSIM_cLine31_rank >= __CSIM_cLine33_rank) {
                    __CSIM_cLine31_rank = 0;
                    __CSIM_cLine31_tags = tags;
                    __CSIM_cLine31_dirty = true;
                }
               else if (__CSIM_cLine32_rank >= __CSIM_cLine30_rank && __CSIM_cLine32_rank >= __CSIM_cLine31_rank && __CSIM_cLine32_rank >= __CSIM_cLine33_rank) {
                    __CSIM_cLine32_rank = 0;
                    __CSIM_cLine32_tags = tags;
                    __CSIM_cLine32_dirty = true;
                }
               else if (__CSIM_cLine33_rank >= __CSIM_cLine30_rank && __CSIM_cLine33_rank >= __CSIM_cLine31_rank && __CSIM_cLine33_rank >= __CSIM_cLine32_rank) {
                    __CSIM_cLine33_rank = 0;
                    __CSIM_cLine33_tags = tags;
                    __CSIM_cLine33_dirty = true;
                }
            }
        }
    }
}

void __CSIM_print_stat(void)
{
    printf("===============STAT================\n");
    printf("Total memory access: %d\n", __CSIM_num);

    printf("Total memeory load: %d\n", __CSIM_num_Load);
    printf("Total CSIM_Load hit: %d\n", __CSIM_num_Load_hit);
    printf("Total CSIM_Load miss: %d\n", __CSIM_num_Load_miss);

    printf("Total memory store: %d\n", __CSIM_num_Store);
    printf("Total CSIM_Store hit: %d\n", __CSIM_num_Store_hit);
    printf("Total CSIM_Store miss: %d\n", __CSIM_num_Store_miss);
}

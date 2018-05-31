extern char __VERIFIER_nondet_char(void);
extern void __CRAB_assert(int);

signed char x __attribute__ ((aligned (64)));
signed char y __attribute__ ((aligned (64)));
signed char t __attribute__ ((aligned (64)));


void simple()
{
    __CSIM_init_cache();

    x = __VERIFIER_nondet_char();
    y = __VERIFIER_nondet_char();

    if (y > 0) {
        t = 1;
    }

    __CRAB_assert(__CSIM_num_Store_miss > 1);    // [2, 3]

}

int main()
{
    simple();
    return 0;
}

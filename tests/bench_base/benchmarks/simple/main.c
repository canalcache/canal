int i __attribute__((aligned (64)));

void simple() {

    // init_stat
    __CSIM_init_stat();

    i = 0;      // 1 load

    while (i<10) {       // 11 loads
        i ++;            // 1 load, 1 store x 10 times = 10 loads, 10 stores
    }

    // Total: 22 loads, 10 stores

    __CSIM_print_stat();
}

int main () {

    __CSIM_init_cache();
    simple();

    return 0;
}

/*
 * Date: 2018. 03. 28.
 * Author: Chungha Sung (chunghas@usc.edu)
 * The code has been changed to test CacheSim.
 * The original code is from SV-COMP repository (https://github.com/sosy-lab/sv-benchmarks)
 * The file name is c/bitvector/gcd_1_true-unreach-call_true-no-overflow.c
 */


signed char t __attribute__ ((aligned (64)));
signed char x __attribute__ ((aligned (64)));
signed char y __attribute__ ((aligned (64)));

void __CSIM_MAIN__(signed char xt, signed char yt)
{
    x = xt;
    y = yt;

    if (y > 0 && x % y == 0) {
        //g = gcd_test(x, y);
        if (x < 0) x = -x;
        if (y < 0) y = -y;

        while (y != 0) {
            t = y;
            y = x % y;
            x = t;
        }
    }
}


int main()
{
	signed char x1, y1, x2, y2;
	unsigned int access1, miss1, access2, miss2;
    __CSIM_MAIN__(x1, y1);
    __CSIM_MAIN__(x2, y2);

    return 0;
}

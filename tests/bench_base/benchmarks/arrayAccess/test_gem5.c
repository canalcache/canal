#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <inttypes.h>
#include <emmintrin.h>
//#include "gem5/m5ops.h"
//#include <x86intrin.h.>

//#include <asm/cachectl.h>

// In here, I used 16384 as standard for full cold cache
// since (index is 13 bits) + (8-way is 3 bits) - (move by 4 bytes which is 2 bits) = 14 bits
// at least 2^14 = 16384 size of array is needed to fill the cache fully.

#define ArrLength 9216
//#define ArrLength 16

int init1[256] __attribute__ ((aligned (64)));
int init2[256] __attribute__ ((aligned (64)));
int i __attribute__((aligned (64)));
int test_array[ArrLength] __attribute__ ((aligned (64)));

int main () {


    init1[0] = 0, init1[1] = 0, init1[2] = 0, init1[3] = 0, init1[4] = 0, init1[5] = 0, init1[6] = 0, init1[7] = 0;
    init1[8] = 0, init1[9] = 0, init1[10] = 0, init1[11] = 0, init1[12] = 0, init1[13] = 0, init1[14] = 0, init1[15] = 0;
    init1[16] = 0, init1[17] = 0, init1[18] = 0, init1[19] = 0, init1[20] = 0, init1[21] = 0, init1[22] = 0, init1[23] = 0;
    init1[24] = 0, init1[25] = 0, init1[26] = 0, init1[27] = 0, init1[28] = 0, init1[29] = 0, init1[30] = 0, init1[31] = 0;
    init1[32] = 0, init1[33] = 0, init1[34] = 0, init1[35] = 0, init1[36] = 0, init1[37] = 0, init1[38] = 0, init1[39] = 0;
    init1[40] = 0, init1[41] = 0, init1[42] = 0, init1[43] = 0, init1[44] = 0, init1[45] = 0, init1[46] = 0, init1[47] = 0;
    init1[48] = 0, init1[49] = 0, init1[50] = 0, init1[51] = 0, init1[52] = 0, init1[53] = 0, init1[54] = 0, init1[55] = 0;
    init1[56] = 0, init1[57] = 0, init1[58] = 0, init1[59] = 0, init1[60] = 0, init1[61] = 0, init1[62] = 0, init1[63] = 0;
    init1[64] = 0, init1[65] = 0, init1[66] = 0, init1[67] = 0, init1[68] = 0, init1[69] = 0, init1[70] = 0, init1[71] = 0;
    init1[72] = 0, init1[73] = 0, init1[74] = 0, init1[75] = 0, init1[76] = 0, init1[77] = 0, init1[78] = 0, init1[79] = 0;
    init1[80] = 0, init1[81] = 0, init1[82] = 0, init1[83] = 0, init1[84] = 0, init1[85] = 0, init1[86] = 0, init1[87] = 0;
    init1[88] = 0, init1[89] = 0, init1[90] = 0, init1[91] = 0, init1[92] = 0, init1[93] = 0, init1[94] = 0, init1[95] = 0;
    init1[96] = 0, init1[97] = 0, init1[98] = 0, init1[99] = 0, init1[100] = 0, init1[101] = 0, init1[102] = 0, init1[103] = 0;
    init1[104] = 0, init1[105] = 0, init1[106] = 0, init1[107] = 0, init1[108] = 0, init1[109] = 0, init1[110] = 0, init1[111] = 0;
    init1[112] = 0, init1[113] = 0, init1[114] = 0, init1[115] = 0, init1[116] = 0, init1[117] = 0, init1[118] = 0, init1[119] = 0;
    init1[120] = 0, init1[121] = 0, init1[122] = 0, init1[123] = 0, init1[124] = 0, init1[125] = 0, init1[126] = 0, init1[127] = 0;
    init1[128] = 0, init1[129] = 0, init1[130] = 0, init1[131] = 0, init1[132] = 0, init1[133] = 0, init1[134] = 0, init1[135] = 0;
    init1[136] = 0, init1[137] = 0, init1[138] = 0, init1[139] = 0, init1[140] = 0, init1[141] = 0, init1[142] = 0, init1[143] = 0;
    init1[144] = 0, init1[145] = 0, init1[146] = 0, init1[147] = 0, init1[148] = 0, init1[149] = 0, init1[150] = 0, init1[151] = 0;
    init1[152] = 0, init1[153] = 0, init1[154] = 0, init1[155] = 0, init1[156] = 0, init1[157] = 0, init1[158] = 0, init1[159] = 0;
    init1[160] = 0, init1[161] = 0, init1[162] = 0, init1[163] = 0, init1[164] = 0, init1[165] = 0, init1[166] = 0, init1[167] = 0;
    init1[168] = 0, init1[169] = 0, init1[170] = 0, init1[171] = 0, init1[172] = 0, init1[173] = 0, init1[174] = 0, init1[175] = 0;
    init1[176] = 0, init1[177] = 0, init1[178] = 0, init1[179] = 0, init1[180] = 0, init1[181] = 0, init1[182] = 0, init1[183] = 0;
    init1[184] = 0, init1[185] = 0, init1[186] = 0, init1[187] = 0, init1[188] = 0, init1[189] = 0, init1[190] = 0, init1[191] = 0;
    init1[192] = 0, init1[193] = 0, init1[194] = 0, init1[195] = 0, init1[196] = 0, init1[197] = 0, init1[198] = 0, init1[199] = 0;
    init1[200] = 0, init1[201] = 0, init1[202] = 0, init1[203] = 0, init1[204] = 0, init1[205] = 0, init1[206] = 0, init1[207] = 0;
    init1[208] = 0, init1[209] = 0, init1[210] = 0, init1[211] = 0, init1[212] = 0, init1[213] = 0, init1[214] = 0, init1[215] = 0;
    init1[216] = 0, init1[217] = 0, init1[218] = 0, init1[219] = 0, init1[220] = 0, init1[221] = 0, init1[222] = 0, init1[223] = 0;
    init1[224] = 0, init1[225] = 0, init1[226] = 0, init1[227] = 0, init1[228] = 0, init1[229] = 0, init1[230] = 0, init1[231] = 0;
    init1[232] = 0, init1[233] = 0, init1[234] = 0, init1[235] = 0, init1[236] = 0, init1[237] = 0, init1[238] = 0, init1[239] = 0;
    init1[240] = 0, init1[241] = 0, init1[242] = 0, init1[243] = 0, init1[244] = 0, init1[245] = 0, init1[246] = 0, init1[247] = 0;
    init1[248] = 0, init1[249] = 0, init1[250] = 0, init1[251] = 0, init1[252] = 0, init1[253] = 0, init1[254] = 0, init1[255] = 0;



    // array access

    //_mm_clflush(&i);
    //_mm_clflush(&test_array[0]);
    //m5_reset_stats(0, 0);

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


    init2[0] = 0, init2[1] = 0, init2[2] = 0, init2[3] = 0, init2[4] = 0, init2[5] = 0, init2[6] = 0, init2[7] = 0;
    init2[8] = 0, init2[9] = 0, init2[10] = 0, init2[11] = 0, init2[12] = 0, init2[13] = 0, init2[14] = 0, init2[15] = 0;
    init2[16] = 0, init2[17] = 0, init2[18] = 0, init2[19] = 0, init2[20] = 0, init2[21] = 0, init2[22] = 0, init2[23] = 0;
    init2[24] = 0, init2[25] = 0, init2[26] = 0, init2[27] = 0, init2[28] = 0, init2[29] = 0, init2[30] = 0, init2[31] = 0;
    init2[32] = 0, init2[33] = 0, init2[34] = 0, init2[35] = 0, init2[36] = 0, init2[37] = 0, init2[38] = 0, init2[39] = 0;
    init2[40] = 0, init2[41] = 0, init2[42] = 0, init2[43] = 0, init2[44] = 0, init2[45] = 0, init2[46] = 0, init2[47] = 0;
    init2[48] = 0, init2[49] = 0, init2[50] = 0, init2[51] = 0, init2[52] = 0, init2[53] = 0, init2[54] = 0, init2[55] = 0;
    init2[56] = 0, init2[57] = 0, init2[58] = 0, init2[59] = 0, init2[60] = 0, init2[61] = 0, init2[62] = 0, init2[63] = 0;
    init2[64] = 0, init2[65] = 0, init2[66] = 0, init2[67] = 0, init2[68] = 0, init2[69] = 0, init2[70] = 0, init2[71] = 0;
    init2[72] = 0, init2[73] = 0, init2[74] = 0, init2[75] = 0, init2[76] = 0, init2[77] = 0, init2[78] = 0, init2[79] = 0;
    init2[80] = 0, init2[81] = 0, init2[82] = 0, init2[83] = 0, init2[84] = 0, init2[85] = 0, init2[86] = 0, init2[87] = 0;
    init2[88] = 0, init2[89] = 0, init2[90] = 0, init2[91] = 0, init2[92] = 0, init2[93] = 0, init2[94] = 0, init2[95] = 0;
    init2[96] = 0, init2[97] = 0, init2[98] = 0, init2[99] = 0, init2[100] = 0, init2[101] = 0, init2[102] = 0, init2[103] = 0;
    init2[104] = 0, init2[105] = 0, init2[106] = 0, init2[107] = 0, init2[108] = 0, init2[109] = 0, init2[110] = 0, init2[111] = 0;
    init2[112] = 0, init2[113] = 0, init2[114] = 0, init2[115] = 0, init2[116] = 0, init2[117] = 0, init2[118] = 0, init2[119] = 0;
    init2[120] = 0, init2[121] = 0, init2[122] = 0, init2[123] = 0, init2[124] = 0, init2[125] = 0, init2[126] = 0, init2[127] = 0;
    init2[128] = 0, init2[129] = 0, init2[130] = 0, init2[131] = 0, init2[132] = 0, init2[133] = 0, init2[134] = 0, init2[135] = 0;
    init2[136] = 0, init2[137] = 0, init2[138] = 0, init2[139] = 0, init2[140] = 0, init2[141] = 0, init2[142] = 0, init2[143] = 0;
    init2[144] = 0, init2[145] = 0, init2[146] = 0, init2[147] = 0, init2[148] = 0, init2[149] = 0, init2[150] = 0, init2[151] = 0;
    init2[152] = 0, init2[153] = 0, init2[154] = 0, init2[155] = 0, init2[156] = 0, init2[157] = 0, init2[158] = 0, init2[159] = 0;
    init2[160] = 0, init2[161] = 0, init2[162] = 0, init2[163] = 0, init2[164] = 0, init2[165] = 0, init2[166] = 0, init2[167] = 0;
    init2[168] = 0, init2[169] = 0, init2[170] = 0, init2[171] = 0, init2[172] = 0, init2[173] = 0, init2[174] = 0, init2[175] = 0;
    init2[176] = 0, init2[177] = 0, init2[178] = 0, init2[179] = 0, init2[180] = 0, init2[181] = 0, init2[182] = 0, init2[183] = 0;
    init2[184] = 0, init2[185] = 0, init2[186] = 0, init2[187] = 0, init2[188] = 0, init2[189] = 0, init2[190] = 0, init2[191] = 0;
    init2[192] = 0, init2[193] = 0, init2[194] = 0, init2[195] = 0, init2[196] = 0, init2[197] = 0, init2[198] = 0, init2[199] = 0;
    init2[200] = 0, init2[201] = 0, init2[202] = 0, init2[203] = 0, init2[204] = 0, init2[205] = 0, init2[206] = 0, init2[207] = 0;
    init2[208] = 0, init2[209] = 0, init2[210] = 0, init2[211] = 0, init2[212] = 0, init2[213] = 0, init2[214] = 0, init2[215] = 0;
    init2[216] = 0, init2[217] = 0, init2[218] = 0, init2[219] = 0, init2[220] = 0, init2[221] = 0, init2[222] = 0, init2[223] = 0;
    init2[224] = 0, init2[225] = 0, init2[226] = 0, init2[227] = 0, init2[228] = 0, init2[229] = 0, init2[230] = 0, init2[231] = 0;
    init2[232] = 0, init2[233] = 0, init2[234] = 0, init2[235] = 0, init2[236] = 0, init2[237] = 0, init2[238] = 0, init2[239] = 0;
    init2[240] = 0, init2[241] = 0, init2[242] = 0, init2[243] = 0, init2[244] = 0, init2[245] = 0, init2[246] = 0, init2[247] = 0;
    init2[248] = 0, init2[249] = 0, init2[250] = 0, init2[251] = 0, init2[252] = 0, init2[253] = 0, init2[254] = 0, init2[255] = 0;



    return 0;
}

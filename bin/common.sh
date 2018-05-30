#!/bin/bash

#### Clang paths
## Clang 3.4
export CLANG_34=/usr/lib/llvm-3.4/build/bin/clang
export CLANGP_34=/usr/lib/llvm-3.4/build/bin/clang++
## Clang 3.8
export CLANG_38=/usr/lib/llvm-3.8/build/bin/clang
export CLANGP_38=/usr/lib/llvm-3.8/build/bin/clang++
export CLANG_391=/usr/lib/llvm-3.9.1/build/bin/clang
export CLANGP_391=/usr/lib/llvm-3.9.1/build/bin/clang++


#### LLVM paths for each version (3.4, 3.8, 3.9.1)
export LLVM_34=/usr/lib/llvm-3.4/build/bin/llvm-dis
export LLVM_38=/usr/lib/llvm-3.8/build/bin/llvm-dis
export LLVM_391=/usr/lib/llvm-3.9.1/build/bin/llvm-dis

#### CMake configuration paths fore each version (3.4, 3.9, 3.9.1)
export CDIR_34=/usr/lib/llvm-3.4/build/share/llvm/cmake
export CDIR_38=/usr/lib/llvm-3.8/build/share/llvm/cmake
export CDIR_391=/usr/lib/llvm-3.9.1/build/lib/cmake/llvm

#### opt paths for each version (3.4, 3.8, 3.9.1)
export OPT_34=/usr/lib/llvm-3.4/build/bin/opt
export OPT_38=/usr/lib/llvm-3.8/build/bin/opt
export OPT_391=/usr/lib/llvm-3.9.1/build/bin/opt

#### nm paths for each version (3.4, 3.8, 3.9.1)
export NM_34=/usr/lib/llvm-3.4/build/bin/llvm-nm
export NM_38=/usr/lib/llvm-3.8/build/bin/llvm-nm
export NM_391=/usr/lib/llvm-3.9.1/build/bin/llvm-nm

#### Cache repository path
export CACHE_REPOSITORY=/home/gpsim/canal


#### GPSIM Pass paths
export API_BUILD_DIR=${CACHE_REPOSITORY}/src/build
export API_INSERT_SO=${CACHE_REPOSITORY}/src/build/apiInsertion/libapiInsert.so
export API_INSERT_SO_34=${CACHE_REPOSITORY}/src/build34/apiInsertion/libapiInsert.so
export API_INSERT_SO_38=${CACHE_REPOSITORY}/src/build38/apiInsertion/libapiInsert.so
export APIINSERT="ApiInsert"


## File paths for build
export CACHE_CONFIG=${CACHE_REPOSITORY}/tests/sim_config/user_cache_config.txt
export HEADER_OUT_NAME="cSim.h"
export HEADER_OUT=${CACHE_REPOSITORY}/tests/${HEADER_OUT_NAME}

DEBUG_FLAG="false"

### error detect
die() {
    echo "${1:-}"
    exit 1
}

#### Build pass functions
buildPass_34() {
    echo "Building pass using CLANG/LLVM 3.4"
    CUR_PATH=`pwd`
    rm -rf ${API_BUILD_DIR} ?
    mkdir ${API_BUILD_DIR}
    cd ${API_BUILD_DIR} || die "error: moving to build directory"
    cmake -DLLVM_DIR=${CDIR_34} .. || die "error: Cmake failed"
    make || die "error: make failed"
    cd $CUR_PATH
}
    
buildPass_38() {
    echo "Building pass using CLANG/LLVM 3.8"
    CUR_PATH=`pwd`
    rm -rf ${API_BUILD_DIR} ?
    mkdir ${API_BUILD_DIR}
    cd ${API_BUILD_DIR} || die "error: moving to build directory"
    cmake -DLLVM_DIR=${CDIR_38} .. || die "error: Cmake failed"
    make || die "error: make failed"
    cd $CUR_PATH
}

buildPass_391() {
    echo "Building pass using CLANG/LLVM 3.9.1"
    CUR_PATH=`pwd`
    rm -rf ${API_BUILD_DIR} ?
    mkdir ${API_BUILD_DIR}
    cd ${API_BUILD_DIR} || die "error: moving to build directory"
    cmake -DLLVM_DIR=${CDIR_391} .. || die "error: Cmake failed"
    make || die "error: make failed"
    cd $CUR_PATH
}

#### Build header function

print_debug_init() {
    printf "
#if DEBUG
    printf(\"-----------------------------\\\n\");
    printf(\"Stats are initialized\\\n\");
    printf(\"-----------------------------\\\n\");
#endif\n\n"
}


## print init_stat function
print_init_stat() {
    printf "void __CSIM_init_stat (void)
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
    __CSIM_Store_ret = false;\n"

    print_debug_init

    printf "\n}\n"
}

## print init_cache function
print_init_cache() {
    printf "void __CSIM_init_cache (void)
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
    "
    printf "\n"

    ## initialize tags
    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        printf "    "
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_tags=0"
            let COUNT_WAY=COUNT_WAY+1
            if [ ${COUNT_WAY} -lt ${WAY_NUM} ]; then
                printf ", "
            fi
        done
        printf ";\n"
        let COUNT_SET=COUNT_SET+1
    done

    ## initialize rank
    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        printf "    "
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_rank=0"
            let COUNT_WAY=COUNT_WAY+1
            if [ ${COUNT_WAY} -lt ${WAY_NUM} ]; then
                printf ", "
            fi
        done
        printf ";\n"
        let COUNT_SET=COUNT_SET+1
    done

    ## initialize taken
    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        printf "    "
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_taken=false"
            let COUNT_WAY=COUNT_WAY+1
            if [ ${COUNT_WAY} -lt ${WAY_NUM} ]; then
                printf ", "
            fi
        done
        printf ";\n"
        let COUNT_SET=COUNT_SET+1
    done

    ## initialize dirty
    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        printf "    "
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_dirty=false"
            let COUNT_WAY=COUNT_WAY+1
            if [ ${COUNT_WAY} -lt ${WAY_NUM} ]; then
                printf ", "
            fi
        done
        printf ";\n"
        let COUNT_SET=COUNT_SET+1
    done

    printf "
    printf(\"SET_NUM: %%d\\\n\", SET_NUM);
    printf(\"OFFSET_NUM: %%d\\\n\", OFFSET_NUM);
    printf(\"WAY_NUM: %%d\\\n\", WAY_NUM);
    printf(\"Total Length: %%d\\\n\", TOTAL_LENGTH);
}\n"

}



print_print_stat() {
    printf "void __CSIM_print_stat(void)
{
    printf(\"===============STAT================\\\n\");
    printf(\"Total memory access: %%d\\\n\", __CSIM_num);

    printf(\"Total memeory load: %%d\\\n\", __CSIM_num_Load);
    printf(\"Total CSIM_Load hit: %%d\\\n\", __CSIM_num_Load_hit);
    printf(\"Total CSIM_Load miss: %%d\\\n\", __CSIM_num_Load_miss);

    printf(\"Total memory store: %%d\\\n\", __CSIM_num_Store);
    printf(\"Total CSIM_Store hit: %%d\\\n\", __CSIM_num_Store_hit);
    printf(\"Total CSIM_Store miss: %%d\\\n\", __CSIM_num_Store_miss);
}\n"
}


print_declarations() {
    # Declaration of tags
    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        printf "__CSIM_addr_t "
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_tags"
            let COUNT_WAY=COUNT_WAY+1
            if [ ${COUNT_WAY} -lt ${WAY_NUM} ]; then
                printf ", "
            fi
        done
        printf ";\n"
        let COUNT_SET=COUNT_SET+1
    done

    # Declaration of rank
    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        printf "__CSIM_addr_t "
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_rank"
            let COUNT_WAY=COUNT_WAY+1
            if [ ${COUNT_WAY} -lt ${WAY_NUM} ]; then
                printf ", "
            fi
        done
        printf ";\n"
        let COUNT_SET=COUNT_SET+1
    done

    # Declaration of taken
    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        printf "bool "
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_taken"
            let COUNT_WAY=COUNT_WAY+1
            if [ ${COUNT_WAY} -lt ${WAY_NUM} ]; then
                printf ", "
            fi
        done
        printf ";\n"
        let COUNT_SET=COUNT_SET+1
    done

    # Declaration of dirty
    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        printf "bool "
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_dirty"
            let COUNT_WAY=COUNT_WAY+1
            if [ ${COUNT_WAY} -lt ${WAY_NUM} ]; then
                printf ", "
            fi
        done
        printf ";\n"
        let COUNT_SET=COUNT_SET+1
    done
}

# args:
# $1: total cache size
# $2: cache associativity
# $3: cache line size
spec_computation() {

    CACHE_TOTAL_SIZE="$1"
    WAY_NUM="$2"
    OFFSET_NUM="$3"
    TOTAL_BITS="64"

    # Total number of cache blocks (lines)
    TOTAL_SIZE=`python -c "print (1024 * ${CACHE_TOTAL_SIZE})"`
    BLOCK_CNT=`python -c "print ${TOTAL_SIZE}/${OFFSET_NUM}"`

    # Number of cache blocks per 1-way which is SET_NUM
    SET_NUM=`python -c "print ${BLOCK_CNT}/${WAY_NUM}"`

    # GET index Number
    TEMP=`echo "obase=2;${SET_NUM}" | bc`
    TEMP_LENGTH=$(echo -n $TEMP | wc -m)
    SET_BIT=`expr $TEMP_LENGTH - 1`
    
    # Cache block size is CACHE_LINE_SIZE
    TEMP=`echo "obase=2;${OFFSET_NUM}" | bc`
    TEMP_LENGTH=$(echo -n $TEMP | wc -m)
    OFFSET_BIT=`expr $TEMP_LENGTH - 1`

    # Set associativity
    TEMP=`echo "obase=2;${WAY_NUM}" | bc`
    TEMP_LENGTH=$(echo -n $TEMP | wc -m)
    WAY_BIT=`expr $TEMP_LENGTH - 1`


    TAG_BIT=`expr $TOTAL_BITS - $OFFSET_BIT - $SET_BIT`

    SET_OFFSET_BIT=`expr $TOTAL_BITS - $TAG_BIT`
    SET_OFFSET_NUM=`python -c "print 2**${SET_OFFSET_BIT}"`

    TOTAL_LENGTH=`python -c "print $SET_NUM * $WAY_NUM"`

}

# args:
# $1: total cache size
# $2: cache associativity
# $3: cache line size
# $4: output dir
build_header() {
	HEADER_OUT=$4/$HEADER_OUT_NAME
    echo "Generate a headerfile at ${HEADER_OUT} ..."

    spec_computation "$1" "$2" "$3"

    echo "/****************************************************************/" > ${HEADER_OUT}
    echo "/* Cache specification (Byte address) */" >> ${HEADER_OUT}
    echo "/* Cache total size: $CACHE_TOTAL_SIZE KB */" >> ${HEADER_OUT}
    echo "/* Cache ways of associativity: ${WAY_NUM} */" >> ${HEADER_OUT}
    echo "/* Cache line size: ${OFFSET_NUM} B */" >> ${HEADER_OUT}
#echo "/* Cache number of sets: $SETS */" >> ${HEADER_OUT}




    echo "/*  [ Tags ($TAG_BIT bits) | Set ($SET_BIT bits) | Offset ($OFFSET_BIT bits) ] */" >> ${HEADER_OUT}
    echo "/* Eviction policy: LRU */" >> ${HEADER_OUT}
    echo "/****************************************************************/" >> ${HEADER_OUT}

    echo "#define BITS $TOTAL_BITS" >> ${HEADER_OUT}
    echo "#define TAG_BIT $TAG_BIT" >> ${HEADER_OUT}
    echo "#define SET_BIT $SET_BIT" >> ${HEADER_OUT}
    echo "#define OFFSET_BIT $OFFSET_BIT" >> ${HEADER_OUT}
    echo "#define WAY_BIT $WAY_BIT" >> ${HEADER_OUT}
    echo "#define SET_OFFSET_BIT $SET_OFFSET_BIT" >> ${HEADER_OUT}


    echo "#define SET_NUM $SET_NUM" >> ${HEADER_OUT}
    echo "#define OFFSET_NUM $OFFSET_NUM" >> ${HEADER_OUT}
    echo "#define SET_OFFSET_NUM $SET_OFFSET_NUM" >> ${HEADER_OUT}
    echo "#define WAY_NUM $WAY_NUM" >> ${HEADER_OUT}
    echo "#define TOTAL_LENGTH $TOTAL_LENGTH" >> ${HEADER_OUT}


    echo "" >> ${HEADER_OUT}

    if [ ${TOTAL_BITS} == "32" ]
    then
        echo "#define __CSIM_addr_t unsigned int" >> ${HEADER_OUT}
    elif [ ${TOTAL_BITS} == "64" ]
    then
        echo "#define __CSIM_addr_t unsigned long long" >> ${HEADER_OUT}
    else
        echo "Wrong Total bits" 
        exit 1
    fi

    echo "" >> ${HEADER_OUT}


    # add header
    printf "#include <limits.h>
#include <stdio.h>
#include <stdbool.h>

#define DEBUG ${DEBUG_FLAG}

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
unsigned int __CSIM_num_Store_miss;\n" >> ${HEADER_OUT}

    printf "__CSIM_CACHE_RET __CSIM_Load_ret;\n" >> ${HEADER_OUT}
    printf "__CSIM_CACHE_RET __CSIM_Store_ret;\n" >> ${HEADER_OUT}
    

    ## print declarations of variables
    printf "\n" >> ${HEADER_OUT}

    print_declarations >> ${HEADER_OUT}
    
    printf "\n" >> ${HEADER_OUT}

    ## print init_stat function
    print_init_stat >> ${HEADER_OUT}

    ## print init_cache function
    print_init_cache >> ${HEADER_OUT}

    printf "\n" >> ${HEADER_OUT}

    print_csim_load_store "Load" >> ${HEADER_OUT} || die "print_csim_load_store fail"
    printf "\n" >> ${HEADER_OUT}
    print_csim_load_store "Store" >> ${HEADER_OUT} || die "print_csim_load_store fail"
    printf "\n" >> ${HEADER_OUT}

    ## print stat function
    print_print_stat >> ${HEADER_OUT}

    ## Print the results
    echo "/****************************************************************/"
    echo "/* Cache specification (Byte address) */"
    echo "/* Cache total size: $CACHE_TOTAL_SIZE KB */"
    echo "/* Cache ways of associativity: ${WAY_NUM} */"
    echo "/* Cache line size: ${OFFSET_NUM} B */"
    echo "/* Cache number of sets: ${SET_NUM} */"
    echo "/* [ Tags ($TAG_BIT bits) | Set ($SET_BIT bits) | Offset ($OFFSET_BIT bits) ] */"
    echo "/* Eviction policy: LRU */"
    echo "/****************************************************************/"

    echo "Done"
}


print_csim_load_store() {
    if [ ${1} != "Load" ] && [ ${1} != "Store" ]; then
        echo "print_cache_load_store function needs parameter Load or Store"
        return 1
    fi
    printf "void __CSIM_${1}(__CSIM_addr_t tags, __CSIM_addr_t set) { 
    /* Function: get_set */
    /* [ tags | set | offset ] -> [ 0 | 0 | set ] */
    /* Same as (tags << SET_OFFSET_BIT)*/"
    printf "\n"


    printf "
    /* incremet __CSIM_num and __CSIM_num_${1} */ 
    __CSIM_num++;
    __CSIM_num_${1}++; 
    /* check whether there is an element with the same tags*/"

    if [ ${1} == "Load" ]; then
        printf "
        #if DEBUG
        printf(\"-----------------------------\\\n\"); 
        printf(\"Load!\\\n\"); 
        //printf(\"Tags: %%llu\\\n\", tags); 
        //printf(\"Set: %%llu\\\n\", set); 
        #endif"
    elif [ ${1} == "Store" ]; then
        printf "
        #if DEBUG
        printf(\"-----------------------------\\\n\"); 
        printf(\"Store!\\\n\"); 
        //printf(\"Tags: %%llu\\\n\", tags); 
        //printf(\"Set: %%llu\\\n\", set); 
        #endif"
        
    fi
        printf "\n"

    COUNT_SET=0
    while [ ${COUNT_SET} -lt ${SET_NUM} ]; do
        COUNT_WAY=0
        if [ ${COUNT_SET} -eq 0 ]; then
            printf "    if (set == ${COUNT_SET}) {"
        else
            printf "    else if (set == ${COUNT_SET}) {"
        fi
        printf "\n"
        ## update rank for all ways
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "        __CSIM_cLine${COUNT_SET}${COUNT_WAY}_rank++;"
            printf "\n"
            let COUNT_WAY=COUNT_WAY+1
        done

        COUNT_WAY=0
        ## check each ways for matching tags
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            printf "        /* check match tag for way ${COUNT_WAY}. */ "
            printf "\n"
            if [ ${COUNT_WAY} -eq 0 ]; then
                printf "        if (__CSIM_cLine${COUNT_SET}${COUNT_WAY}_taken && __CSIM_cLine${COUNT_SET}${COUNT_WAY}_tags == tags) {"
                printf "\n"
            else
                printf "        else if (__CSIM_cLine${COUNT_SET}${COUNT_WAY}_taken && __CSIM_cLine${COUNT_SET}${COUNT_WAY}_tags == tags) {"
                printf "\n"
            fi
            printf "            __CSIM_num_${1}_hit++;"
            printf "\n"
            printf "            "
            printf "#if DEBUG
            printf(\"Cache hit!\\\n\");
            //printf(\"Way:%%d\\\n\", ${COUNT_WAY});
            #endif"
            printf "\n"
            printf "            "
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_rank = 0;"
            printf "\n"
            if [ ${1} == "Store" ]; then
                printf "            "
                printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_dirty = true;"
                printf "\n"
            fi
            printf "            "
            if [ ${1} == "Load" ]; then
                printf " __CSIM_Load_ret = true;"
            elif [ ${1} == "Store" ]; then
                printf " __CSIM_Store_ret = true;"
            fi
            printf "\n"
            printf "        "
            printf "}"
            printf "\n"
            let COUNT_WAY=COUNT_WAY+1
        done

        ## check miss
        printf "        "
        printf "else {"
        printf "\n"
        printf "            "
        printf "/* If nothing has been matched, it is miss */"
        printf "\n"
        printf "            "
        printf "#if DEBUG"
        printf "\n"
        printf "            "
        printf "printf(\"Cache miss!\\\n\");"
        printf "\n"
        printf "            "
        printf "#endif"
        printf "\n"
        printf "            "
        printf "__CSIM_num_${1}_miss++;"
        printf "\n"
        printf "            "
        if [ ${1} == "Load" ]; then
            printf " __CSIM_Load_ret = false;"
        elif [ ${1} == "Store" ]; then
            printf " __CSIM_Store_ret = false;"
        fi
        printf "\n"

        ## check not taken caches
        printf "            "
        printf "/* Cold miss check */"
        printf "\n"
        COUNT_WAY=0
        while [ ${COUNT_WAY} -lt ${WAY_NUM} ]; do
            if [ ${COUNT_WAY} -eq 0 ]; then
                printf "            "
                printf "if (!__CSIM_cLine${COUNT_SET}${COUNT_WAY}_taken) {"
                printf "\n"
            else 
                printf "            "
                printf "else if (!__CSIM_cLine${COUNT_SET}${COUNT_WAY}_taken) {"
                printf "\n"
            fi
            printf "                "
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_taken = true;"
            printf "\n"
            printf "                "
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_tags = tags;"
            printf "\n"
            printf "                "
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_rank = 0;"
            printf "\n"
            if [ ${1} == "Store" ]; then
                printf "                "
                printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY}_dirty = true;"
                printf "\n"
            fi
            printf "            "
            printf "}"
            printf "\n"
            let COUNT_WAY=COUNT_WAY+1
        done

        printf "            "
        printf "else {"
        printf "\n"

        ## check rank
        printf "             "
        printf "/* Pick the highest rank */"
        printf "\n"
        COUNT_WAY1=0
        FIRST=true
        while [ ${COUNT_WAY1} -lt ${WAY_NUM} ]; do
            COUNT_WAY2=0
            if [ ${COUNT_WAY1} -eq 0 ]; then
                printf "               "
                printf "if ("
            else
                printf "               "
                printf "else if ("
            fi


            FIRST=true
            while [ ${COUNT_WAY2} -lt ${WAY_NUM} ]; do
                if [ ${COUNT_WAY1} -ne ${COUNT_WAY2} ]; then
                    if [ "${FIRST}" = true ] ; then
                        printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY1}_rank >= __CSIM_cLine${COUNT_SET}${COUNT_WAY2}_rank"
                        FIRST=false
                    else
                        printf " && __CSIM_cLine${COUNT_SET}${COUNT_WAY1}_rank >= __CSIM_cLine${COUNT_SET}${COUNT_WAY2}_rank"
                    fi
                fi
                let COUNT_WAY2=COUNT_WAY2+1
            done
            printf ") {"
            printf "\n"

#printf "                    "
#printf "#if DEBUG"
#printf "\n"
#printf "                    "
#printf "printf(\"Victim Set:%%d\\\n\", ${COUNT_SET});"
#printf "\n"
#printf "                    "
#printf "printf(\"Victim Way:%%d\\\n\", ${COUNT_WAY1});"
#printf "\n"
#printf "                    "
#printf "#endif"
#printf "\n"

            printf "                    "
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY1}_rank = 0;"
            printf "\n"
            printf "                    "
            printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY1}_tags = tags;"
            printf "\n"
            if [ ${1} == "Store" ]; then
                printf "                    "
                printf "__CSIM_cLine${COUNT_SET}${COUNT_WAY1}_dirty = true;"
                printf "\n"
            fi
            printf "                "
            printf "}"
            printf "\n"
            let COUNT_WAY1=COUNT_WAY1+1
        done
        printf "            "
        printf "}"
        printf "\n"
        let COUNT_SET=COUNT_SET+1
        printf "        "
        printf "}"
        printf "\n"
        printf "    "
        printf "}"
        printf "\n"
    done
    printf "}"
    printf "\n"
}


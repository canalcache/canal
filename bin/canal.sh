#!/bin/bash

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#INC="-I/home/gpsim/smack/share/smack/include -I/home/gpsim/klee/include"
INC=""

USAGE=$'Usage: ./canal.sh --orig-file [original file] --verify-file [verifiable file] --llvm-version [3.4 or 3.8] [other options...]
==== options ====
--orig-file <original file> : to get a symbol table
--verify-file <verifiable file> : the file where Canal functions are variables are used
-I <include path>
-o <output> : the name of output file
--cache-line-size <N> : the cache line size in bytes (default 64)
--cache-assoc <N> : the number of ways in the cache (default 4)
--cache-size <N> : the total size of cache in KB (default 1)'

source $BIN_DIR/common.sh

POSITIONAL=()
while [[ $# -gt 0 ]]
do
	key="$1"

	case $key in
        -h | --help)
			echo "$USAGE"
            exit 0
            ;;
        -I)
            INC="-I$2"
            shift # past argument
            shift # past value
            ;;
		--orig-file)
			ORIG_FILE="$2"
			shift # past argument
			shift # past value
			;;
		--verify-file)
			VERIFY_FILE="$2"
			shift # past argument
			shift # past value
			;;
		-o)
			OUTPUT_FILE="$2"
			shift # past argument
			shift # past value
			;;
		--symbol-file)
			SYMBOL_FILE="$2"
			shift # past argument
			shift # past value
			;;
		--llvm-version)
			LLVM_VERSION="$2"
			shift # past argument
			shift # past value
			;;
		--cache-line-size)
			CACHE_LINE_SIZE="$2"
			shift # past argument
			shift # past value
			;;
		--cache-assoc)
			CACHE_ASSOC="$2"
			shift # past argument
			shift # past value
			;;
		--cache-size)
			CACHE_SIZE="$2"
			shift # past argument
			shift # past value
			;;
		*)    # unknown option
			POSITIONAL+=("$1") # save it in an array for later
			shift # past argument
			;;
	esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# make sure we have what we need
if [[ -z $ORIG_FILE ]]; then
	echo "Error: original file not specified";
    echo "$USAGE"
	exit 1
fi
if [[ -z $VERIFY_FILE ]]; then
	echo "Error: no verify file specified"
    echo "$USAGE"
	exit 1
fi
if [[ -z $LLVM_VERSION ]]; then
	echo "Error: no llvm version specified"
    echo "$USAGE"
	exit 1
fi

# set defaults if we have to 
file_ext="${ORIG_FILE##*.}"
if [[ -z $OUTPUT_FILE ]]; then
	OUTPUT_FILE=${VERIFY_FILE/.$file_ext/.bc}
fi
make_sym_file="NO"
if [[ -z $SYMBOL_FILE ]]; then
	make_sym_file="YES"
fi
if [[ -z $CACHE_LINE_SIZE ]]; then
	CACHE_LINE_SIZE=64
fi
if [[ -z $CACHE_SIZE ]]; then
	CACHE_SIZE=1
fi
if [[ -z $CACHE_ASSOC ]]; then
	CACHE_ASSOC=4
fi

case $LLVM_VERSION in
	"3.4")
		CLANG=$CLANG_34
		NM=$NM_34
		LLVM=$LLVM_34
		OPT=$OPT_34
		API_SO=$API_INSERT_SO_34
		;;
	"3.8")
		CLANG=$CLANG_38
		NM=$NM_38
		LLVM=$LLVM_38
		OPT=$OPT_38
		API_SO=$API_INSERT_SO_38
		;;
	*)    # unknown option
		echo "Unknown LLVM version: $LLVM_VERSION"
        echo "You can change common.sh and canal.sh to add a newer version path"
		exit 1
		;;
esac


build_header "$CACHE_SIZE" "$CACHE_ASSOC" "$CACHE_LINE_SIZE" "$( pwd )"

if [[ "$make_sym_file" == "YES" ]]; then
    echo "Get a symbol table"
	echo "${CLANG} -O0 -I/usr/include/x86_64-linux-gnu $INC $ORIG_FILE -o tmp"
	${CLANG} -O0 -I/usr/include/x86_64-linux-gnu $INC $ORIG_FILE -o tmp || die "error: clang to get a symbolTable"
	echo "${NM} tmp > symbolTable.out"
	${NM} tmp > symbolTable.out || die "error: NM to get a symbolTable"
	echo "rm tmp"
	rm tmp
	SYMBOL_FILE="symbolTable.out"
fi

echo "#include \"${HEADER_OUT_NAME}\"" > tmp.c
cat $VERIFY_FILE >> tmp.c

echo "${CLANG} -O0 -I/usr/include/x86_64-linux-gnu $INC -emit-llvm -S -c tmp.c -o tmp_before_pass.bc"
${CLANG} -O0 -I/usr/include/x86_64-linux-gnu $INC -emit-llvm -S -c tmp.c -o tmp_before_pass.bc || die "error: clang"

echo "${OPT} -load $API_SO -${APIINSERT} tmp_before_pass.bc -o tmp_after_pass.bc"
${OPT} -load $API_SO -${APIINSERT} tmp_before_pass.bc -o tmp_after_pass.bc || die "error: opt with CANAL"

echo "${LLVM} tmp_after_pass.bc"
${LLVM} tmp_after_pass.bc || die "error: llvm-dis with .bc"

echo "mv tmp_after_pass.bc $OUTPUT_FILE"
mv tmp_after_pass.bc $OUTPUT_FILE

echo "rm tmp_before_pass.bc tmp.c symbolTable.out tmp_after_pass.ll"
rm tmp_before_pass.bc tmp.c symbolTable.out tmp_after_pass.ll

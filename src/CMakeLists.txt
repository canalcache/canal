cmake_minimum_required(VERSION 3.5.1)
project(LLVMRedundantLocks)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# Set your project compile flags. E.g. if using the C++ header files you will
# need to enable C++11 support for your compiler.

add_definitions(${LLVM_DEFINITIONS} -std=c++11 -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -Wall -g -fno-rtti)
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(/usr/lib/llvm-3.4/build/include)
include_directories(/usr/lib/llvm-3.4/include)

add_subdirectory(apiInsertion)

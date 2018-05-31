#!/bin/bash

source bin/common.sh

cd src

buildPass_34

rm -rf build34
mv build build34

buildPass_38

rm -rf build38
mv build build38

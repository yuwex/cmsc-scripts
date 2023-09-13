#!/bin/bash

# This is a simple script that checks public tests
# It is specifically built to work with a c program that has input via `scanf` and output via `printf`
#
# Requires that you have already compiled a c file
# Requires that the input data be in the format `filename.in`
# requires that expected output be in the format `filename.output`
#
# Run this file with the argument of the filename to test
#
# Ex: pdiff.sh public01
#
# Alias this file to the command `ptest` by adding this to your aliases:
# alias ptest "bash ~/path/to/ptest.sh"


RED=$(tput setaf 1);
BLUE=$(tput setaf 4);
RESET=$(tput sgr0);

for a in public*.in;
do

    touch ptest_temp_results;
    test="${a%.*}";

    a.out < $a > ptest_temp_results;
    output=$(diff -U 0 -b ptest_temp_results "${test}.output"); 
    
    if [[ "$output" ]]; then
	echo "${RED}FAILED${RESET} ${test}";
    else
	echo "${BLUE}PASSED${RESET} ${test}";
	
    fi
    rm ptest_temp_results;

done

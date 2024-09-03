#!/bin/bash

if [ $# -ne 2 ]; then
        echo "Not Enough Parameters"
        exit 1
fi

temp=$(mktemp/tmp/XXX)

for name in $(cat ${1}); do

        if [ ! -r ${name}.out]; then
                echo "Error in ${name}.out File"
                exit 1
        fi

        if [ ! -r ${name}.args ]; then
                $2 > $temp
        else
                $2 $(cat ${name}.args) > $temp
        fi

        if [ (cmp ${name}.out temp) -eq 1]; then
                echo Test failed: ${name}
                echo Args:
                cat ${name}.args
                echo Expected:
                cat ${name}.out
                echo Actual:
                cat $temp
        fi
done

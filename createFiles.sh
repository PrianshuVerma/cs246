#!/bin/bash

if [ $# -ne 2 ]; then
        exit 1
fi

for name in $(cat ${1}); do
        if [ ! -r ${name}.args ]; then
                $2 > ${name}.out
        else
                $2 $(cat ${name}.args) > ${name}.out
        fi
done

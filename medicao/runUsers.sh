#!/bin/bash

for i in {0..50}
do
    echo $(python simula-users.py) &
done



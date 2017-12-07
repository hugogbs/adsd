#!/bin/bash

for i in {0..25}
do
    echo $(python simula-users.py) &
done



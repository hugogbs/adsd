#!/bin/bash

for i in {0..10}
do
    echo $(date +%s%N) ",inicio ,"$i >> requestlogput250.txt
    curl -w %{time_namelookup},%{time_connect},%{time_starttransfer},%{time_total}\\n -s https://sistemaalocacao.firebaseapp.com/classes/ -o /dev/null  >> dblogput250.txt
    echo $(date +%s%N) ", fim, "$i >> requestlogput250.txt
    sleep .1
done

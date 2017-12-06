#!/bin/bash

for i in {0..10}
do
    echo $(date +"%T.%6N") ",inicio ,"$i >> reqB-10t-100u.txt
    curl -X -d -w %{time_connect}-%{time_starttransfer}-%{time_total}\\n -s https://sistemaalocacao.firebaseapp.com/classes/ -o /dev/null  >> timesB-10t-100u.txt
    echo $(date +"%T.%6N") ", fim, "$i >> reqB-10t-100u.txt
    sleep .1
done

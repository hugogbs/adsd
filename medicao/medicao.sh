#!/bin/bash

for i in {0..10}
do
    echo $(date +"%T.%6N") ",inicio ,"$i >> requestlogput250.txt
    curl -X -d -w %{time_connect}-%{time_starttransfer}-%{time_total}\\n -s https://sistemaalocacao.firebaseapp.com/classes/ -o /dev/null  >> dblogput250.txt
    echo $(date +"%T.%6N") ", fim, "$i >> requestlogput250.txt
    sleep .1
done

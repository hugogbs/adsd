#!/bin/bash

for i in {0..10}
do
    echo $(date +%s%N) ",inicio ,"$i >> requestlogput250.txt
    curl -X PUT -d '{"status":"Em Preparo"}' https://sistemaalocacao.firebaseapp.com/classes >> dblogput250.txt
    echo $(date +%s%N) ", fim, "$i >> requestlogput250.txt
    sleep .1
done

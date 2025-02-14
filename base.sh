#!/bin/bash
results="/app/results.csv"
echo "Lenguaje,Tiempo (s)" > $results
for lang in python java cpp rust javascript; do
    echo "Ejecutando $lang..."
    docker build -t $lang-benchmark $lang/
    start_time=$(date +%s%N)
    docker run --rm $lang-benchmark > ${lang}/output.txt
    end_time=$(date +%s%N)
    elapsed_time=$(echo "scale=6; ($end_time - $start_time) / 1000000000" | bc)
    echo "$lang,$elapsed_time" >> $results
done
sort -t, -k2 -n $results -o $results
cat $results
#!/bin/bash

results="/app/results.csv"
echo "Lenguaje,Tiempo (s)" > $results

languages=("python" "java" "javascript" "cpp" "rust")

for lang in "${languages[@]}"; do
    echo "Ejecutando $lang..."
    docker build -t ${lang}-benchmark ./$lang/
    start_time=$(date +%s%N)
    docker run --rm ${lang}-benchmark > ./$lang/output.txt
    end_time=$(date +%s%N)
    elapsed_time=$(bc <<< "scale=6; ($end_time - $start_time)/1000000000")
    echo "$lang,$elapsed_time" >> $results
done

sort -t, -k2 -n $results -o $results
cat $results

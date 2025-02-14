#!/bin/bash

mkdir -p outputs

languages=("python" "java" "javascript" "cpp" "rust")

temp_file="execution_times.txt"

> "$temp_file"

for lang in "${languages[@]}"; do
    echo "Procesando $lang..."
    
    echo "Construyendo imagen para $lang..."
    docker build -t "script_$lang" "$lang" > /dev/null 2>&1
    
    echo "Ejecutando contenedor para $lang..."
    execution_time=$(docker run --rm "script_$lang")
    
    echo "$execution_time $lang" >> "$temp_file"
done

echo -e "\nResultados ordenados por tiempo:"
echo "Lenguaje    | Tiempo (ms)"
echo "------------|------------"
sort -n "$temp_file" | awk '{ printf "%-10s | %s ms\n", $2, $1 }'

rm -f "$temp_file"

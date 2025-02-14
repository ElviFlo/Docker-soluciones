#!/bin/bash

mkdir -p outputs

languages=("python" "java" "javascript" "cpp" "rust")

declare -A execution_times

for lang in "${languages[@]}"; do
    echo "Procesando $lang..."
    cd $lang
    
    echo "Construyendo imagen para $lang..."
    docker build -t "script_$lang" .
    
    echo "Ejecutando contenedor para $lang..."
    execution_time=$(docker run --rm -v "$(pwd)/$lang:/app/$lang" "script_$lang")

    execution_times[$lang]=$execution_time
    
    cd ..
done

echo -e "\nResultados:"
echo "Lenguaje | Tiempo (ms)"
echo "---------|------------"
for lang in "${languages[@]}"; do
    echo "$lang | ${execution_times[$lang]}"
done

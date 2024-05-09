#!/bin/bash

if [ "$1" = "--date" ]; then
    current_date=$(date +"%Y-%m-%d")
    echo "Dzisiejsza data: $current_date"
elif [ "$1" = "--logs" ]; then
    num_logs=100
    
    if [ -n "$2" ]; then
        num_logs=$2
    fi
    
    for ((i=1; i<=$num_logs; i++)); do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Utworzony przez: $0" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done
fi

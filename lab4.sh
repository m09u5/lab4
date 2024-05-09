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
elif [ "$1" = "--help" ]; then
    echo "Dost�pne opcje:"
    echo "--date : Wy�wietla dzisiejsz� dat�"
    echo "--logs [liczba_plik�w] : Tworzy automatycznie podan� liczb� plik�w logx.txt"
    echo "--help : Wy�wietla wszystkie dost�pne opcje"
else
    echo "Nieznana opcja. U�yj '--help' aby wy�wietli� dost�pne opcje."
fi
#!/bin/bash

if [[ "$1" = "--date" || "$1" = "-d" ]]; then
    current_date=$(date +"%Y-%m-%d")
    echo "Dzisiejsza data: $current_date"
elif [[ "$1" = "--logs" || "$1" = "-l" ]]; then
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
elif [[ "$1" = "--help" || "$1" = "-h" ]]; then
    echo "Dostêpne opcje:"
    echo "--date (-d) : Wyœwietla dzisiejsz¹ datê"
    echo "--logs [liczba_plików] (-l) : Tworzy automatycznie podan¹ liczbê plików logx.txt"
    echo "--init : Klonuje ca³e repozytorium do katalogu w którym zosta³ uruchomiony oraz ustawia œcie¿kê w zmiennej œrodowiskowej PATH"
    echo "--error [liczba_plików] (-e) : Tworzy podan¹ liczbê plików errorx/errorx.txt. Domyœlnie tworzy 100 plików"
    echo "--help (-h) : Wyœwietla wszystkie dostêpne opcje"
elif [[ "$1" = "--init" ]]; then
    git clone git@github.com:m09u5/lab4.git ./lab4
    export PATH=$PATH:./lab4
elif [[ "$1" = "--error" || "$1" = "-e" ]]; then
    num_errors=100
    
    if [ -n "$2" ]; then
        num_errors=$2
    fi
    
    for ((i=1; i<=$num_errors; i++)); do
        errorfile="error${i}.txt"
        mkdir -p errorx
        echo "B³¹d numer $i" > "errorx/$errorfile"
        echo "Utworzony przez: $0" >> "errorx/$errorfile"
        echo "Data utworzenia: $(date)" >> "errorx/$errorfile"
    done
else
    echo "Nieznana opcja. U¿yj '-h' aby wyœwietliæ dostêpne opcje."
fi

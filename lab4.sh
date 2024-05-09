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
    echo "Dost�pne opcje:"
    echo "--date (-d) : Wy�wietla dzisiejsz� dat�"
    echo "--logs [liczba_plik�w] (-l) : Tworzy automatycznie podan� liczb� plik�w logx.txt"
    echo "--init : Klonuje ca�e repozytorium do katalogu w kt�rym zosta� uruchomiony oraz ustawia �cie�k� w zmiennej �rodowiskowej PATH"
    echo "--error [liczba_plik�w] (-e) : Tworzy podan� liczb� plik�w errorx/errorx.txt. Domy�lnie tworzy 100 plik�w"
    echo "--help (-h) : Wy�wietla wszystkie dost�pne opcje"
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
        echo "B��d numer $i" > "errorx/$errorfile"
        echo "Utworzony przez: $0" >> "errorx/$errorfile"
        echo "Data utworzenia: $(date)" >> "errorx/$errorfile"
    done
else
    echo "Nieznana opcja. U�yj '-h' aby wy�wietli� dost�pne opcje."
fi

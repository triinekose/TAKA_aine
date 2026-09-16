#!/bin/bash
#
# generate_data.sh
#
# Käivitab generate_data.py faili N korda (vaikimisi N=10) ja salvestab
# iga käivituse väljundi eraldi faili "data" kataloogi (data1.txt, data2.txt, ...).
#
# Kasutus:
#   ./generate_data.sh
# Eeldab, et python3 on installitud ja generate_data.py asub samas kataloogis.

N=10

# Skripti enda asukoht (töötab olenemata sellest, kust seda käivitatakse)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$SCRIPT_DIR/../data"

mkdir -p "$DATA_DIR"

for i in $(seq 1 "$N"); do
    python3 "$SCRIPT_DIR/generate_data.py" > "$DATA_DIR/data${i}.txt"
    echo "Loodud fail: data${i}.txt"
done

echo "Kõik $N andmefaili on genereeritud kataloogi: $DATA_DIR"
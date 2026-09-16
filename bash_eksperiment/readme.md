# Bash eksperiment

Ülesandes proovisin bashi kirjutamist - genereerisin Pythoniga juhuslikke arve ja automatiseerisin korduvad käivitused bash-skriptiga. Analüüsisin tulemusi Unix käskudega.

## Kataloogid

 - scripts/ - kõik kasutatud scriptid
 - data/ - genereeritud andmefailid
 - results/ analüüsi tulemus

## Sammud

1. lõin kataloogistruktuuri:
mkdir -p bash_eksperiment/{data,scripts,results}

2. Kirjutasin Python-skripti `generate_data.py`, mis genereerib
   200 juhuslikku täisarvu vahemikus 1-100.

3. Kirjutasin bash-skripti `generate_data.sh`, mis käivitab
   `generate_data.py` 10 korda ja salvestab tulemused eraldi
   failidesse `data` kataloogis:
   chmod +x scripts/generate_data.sh
   ./scripts/generate_data.sh

4. Analüüsisin kõiki andmefaile korraga, et leida iga arvu
   esinemiskordade arv:
   cat data/*.txt | sort -n | uniq -c > results/summary_total_unique_numbers_counted.txt

## Tulemus

Tulemus on failis `results/summary_total_unique_numbers_counted.txt`.
Iga rida näitab, mitu korda vastav number (1-100) kõigis 10 andmefailis
kokku esines.

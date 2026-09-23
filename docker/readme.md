## Dockeri kodutöö - image loomine ja käivitamine

Image loomiseks (kasutades siin kaustas olevat dockerfile) kasutasin juhendis olnud käsku:
```
docker build -t myapp .
```

- myapp asemel võiks imagele panna misiganes muu nime



Et loodud image põhjal konteiner käivitada, kasutasin käsku:
```
docker run myapp
```

Selle käsuga loob Docker myapp imaget kasutades uue konteineri ja käivitab sealse programmi


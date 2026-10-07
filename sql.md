Tabelandmed Pandasega

Pandas on Pythoni teek tabelandmete töötlemiseks. Siin õpid andmeid laadima ja kontrollima, ridu valima, uusi veerge arvutama ning rühmade kokkuvõtteid koostama.

Eeldused: oskad kasutada listi, sõnastikku, tingimust ja funktsiooni ning kasutada objekti meetodeid. Vajaduse korral korda Intro põhiosa. Põhiosa hõlmab peatükke P1–P6; P7–P9 on valikuline lisamaterjal.

Näited ja harjutused kasutavad sama andmestikku. Näidete käivitamine ei sõltu harjutuste lahendamisest. Vaata lahenduskäike pärast seda, kui oled ise proovinud.

P1. Andmete laadimine

Pandas on eraldi paigaldatav teek, mis ei kuulu Pythoni standardteeki. Kui kasutasid alustamisjuhist, on see keskkonnas olemas. Colabis on Pandas tavaliselt juba paigaldatud.

import pandas as pd impordib Pandase ja annab sellele lühinime pd. Import ei paigalda teeki; pärast kerneli taaskäivitamist tuleb impordilahter uuesti käivitada. from pathlib import Path toob kasutusse standardteegi failitee klassi, mida ei pea eraldi paigaldama. Vajaduse korral korda Intro peatükki I8.

pd.read_csv() on Pandase funktsioon, algandmed.head() aga andmetabeli meetod. Mõlemas on punkt, kuid esimeses pöördud teegi, teises konkreetse tabeli poole. pd.read_csv() loeb CSV-faili DataFrame'iks ehk andmetabeliks. CSV on tekstivorming tabelandmete hoidmiseks. Selles failis on esimesel real veerunimed ja järgmistel ridadel andmed; ühe rea väljad on eraldatud komadega.

Järgmine lahter otsib faili repo data kaustast. Kui kohalikku faili pole, loetakse sama andmestik kursuse repo veebiaadressilt. Lahter kuvab kasutatud failitee või veebiaadressi. Kui jätkad tööd pärast kerneli taaskäivitamist, käivita esmalt see lahter uuesti.

display() kuvab tabeli vormindatult. Ka lahtri viimane avaldis kuvatakse automaatselt; mitme tulemuse jaoks kasuta display() või print().

Dokumentatsioon: read_csv.


# Teekide ja vajalike nimede importimine.
from pathlib import Path
import pandas as pd
from IPython.display import display

# Proovi esmalt repo juurkausta, seejärel töövihiku kausta suhtelist teed.
andmefail = Path("data/Islander_data.csv")
if not andmefail.is_file():
    andmefail = Path("../../data/Islander_data.csv")

if andmefail.is_file():
    allikas = andmefail
else:
    allikas = "https://raw.githubusercontent.com/adlerpriit/2025_taka_fall/37b50eb8474faeeb0993c2d4883680bee0560cbd/data/Islander_data.csv"

print("Andmete allikas:", allikas)
print("Pandase versioon:", pd.__version__)

# CSV lugemine Pandase tabeliks.
algandmed = pd.read_csv(allikas)
display(algandmed.head())
     
Andmestikus on virtuaalsete katseisikute mälukatse tulemused. Üks lähterida kirjeldab ühe katseisiku mõõtmisi enne ja pärast katset. age on vanus, Drug ravimirühm ja Dosage annusetase. Happy_Sad_group eristab rõõmsate (H) ja kurbade (S) mälestuste rühma.

Diff = Mem_Score_After − Mem_Score_Before. Positiivne väärtus tähendab skoori suurenemist, negatiivne vähenemist. See ei tähenda mõõdiku täpse selgituseta automaatselt mälu paranemist. Ravimikoodid on A alprasolaam, T triasolaam ja S platseebo.

Täielik andmekirjeldus ja allikaviide on repo andmekaustas. Hoia algandmed muutmata ning tee teisendused töökoopias.

P2. Tabel, veerg ja andmete kontroll

DataFrame on ridadest ja veergudest koosnev andmetabel. Kui valid tabelist ühe veeru kujul inimesed["vanus"], saad Series-objekti: väärtuste jada koos reaindeksiga.

Indeks annab igale reale tähise, mille järgi saab seda valida. Järgmises näites loob Pandas indeksiks arvud 0, 1, 2 ja 3. Indeks ei pruugi aga olla rea järjekorranumber: selleks võib kasutada ka teksti või kuupäevi. Filtreerimisel jäävad alles valitud ridade senised indeksiväärtused.

Hoia reaindeksi väärtused ja veerunimed unikaalsed ehk kordumatud. Tehniliselt lubab Pandas mõlemas kordusi, kuid neid tasub vältida: need võivad muuta valiku tulemuse ootamatuks või põhjustada mõnes toimingus vea.

Alusta väikese tabeliga. Sõnastiku võtmetest saavad veerunimed ja listidest veergude väärtused. Kõigis listides peab olema sama palju elemente.

Dokumentatsioon: DataFrame, Series.


# DataFrame: tabeli loomine sõnastikust.
inimesed = pd.DataFrame({
    "nimi": ["Mari", "Jaan", "Liis", "Peeter"],
    "vanus": [24, 38, 29, 46],
    "linn": ["Tartu", "Tallinn", "Tartu", "Pärnu"],
})
display(inimesed)

# Series: ühe veeru valimine tabelist.
display(inimesed["vanus"])
     
Andmetabeli uurimisel küsi kõigepealt: mida üks rida tähendab, millised veerud on olemas ning kas väärtused on sobivat tüüpi?

.head(n) tagastab esimesed n rida. Nende kuvamiseks kasuta display() või jäta meetodikutse lahtri viimaseks avaldiseks.
.shape annab enniku (ridade arv, veergude arv). See on atribuut, mistõttu selle järele väljakutse sulge ei lisata.
.info() näitab veergude tüüpe ja olemasolevate väärtuste arvu.
.describe() annab siin arvuliste veergude statistilise kokkuvõtte.
Täisarve sisaldava veeru tüüp võib olla int64, ujukomaarve sisaldaval veerul float64. Tekstiveeru tüübinimi võib Pandase versioonist sõltuvalt olla str, string või object. Andmetüüp ei määra üksi tunnuse tähendust: arvuline annusetase võib analüüsis olla kategooria.

Dokumentatsioon: head, shape, info, describe.


# Atribuut shape: ridade ja veergude arv.
print("Ridu ja veerge:", inimesed.shape)

# Meetod info(): andmetüübid ja olemasolevate väärtuste arv.
inimesed.info()

# Meetod describe(): arvuliste veergude statistiline kokkuvõte.
display(inimesed.describe())
     
Ülesanne P-01

Uuri tabelit algandmed: kuva esimesed kaheksa rida, ridade ja veergude arv ning iga veeru andmetüüp ja olemasolevate väärtuste arv. Nimeta kaks arvulist tunnust ning kaks tunnust, mida kasutaksid rühmade moodustamiseks.

Enesekontroll: faili päises on üheksa veergu. Kas oskad selgitada Drug ja Dosage tähendust?


# Kirjuta siia oma kood. Vajaduse korral lisa lahtreid.
     
Kirjuta siia oma vastus või põhjendus.

P3. Valimine, filtreerimine ja sortimine

tabel["veerg"] valib ühe veeru ja tagastab Series-objekti. tabel[["a", "b"]] valib veerud "a" ja "b" ning tagastab neist koosneva tabeli. Sisemised nurksulud moodustavad veerunimede listi.

.loc[read, veerud] võimaldab valida korraga nii ridu kui ka veerge. Enne koma määra valitavad read indeksi tähiste või tingimusega; pärast koma anna veerunimi või veerunimede list.

Tingimus inimesed["vanus"] >= 30 annab iga rea kohta väärtuse True või False. Kui kasutad seda tingimust ridade valimiseks, jäävad alles ainult True-ga märgitud read. Näites valime vähemalt 30-aastaste inimeste nimed ja linnad.

Dokumentatsioon: loc.


# Veergude valimine veerunimede listiga.
display(inimesed[["nimi", "vanus"]])

# Võrdlus: iga rea kohta saadakse True või False.
display(inimesed["vanus"] >= 30)

# loc: tingimusele vastavate ridade ja soovitud veergude valimine.
vahemalt_30 = inimesed.loc[inimesed["vanus"] >= 30, ["nimi", "linn"]]
display(vahemalt_30)
     
Veergude võrdlemisel saadud tingimusi ühenda märkidega & (ja) ja | (või). Märk ~ pöörab tingimuse vastupidiseks. Pane iga võrdlus sulgudesse. Pythoni and ja or ei sobi tervete tõeväärtusveergude ühendamiseks.

.sort_values() järjestab read valitud veeru järgi. ascending=False annab kahaneva järjekorra. Järgmises näites tagastab meetod uue tabeli; algtabel jääb samaks.

Dokumentatsioon: sort_values.


# Filtreerimine: mõlemad tingimused peavad kehtima.
tartu_valik = inimesed.loc[
    (inimesed["linn"] == "Tartu") & (inimesed["vanus"] > 25),
    ["nimi", "vanus"],
]
display(tartu_valik)

# Sortimine: suurima muutusega read esimesena.
display(algandmed.sort_values("Diff", ascending=False).head(5))
     
Ülesanne P-02

Koosta tabelist algandmed kaks eraldi valikut:

Osalejad, kelle vanus on üle 30 ja perekonnanimi Durand.
Osalejad ravimirühmast A, kelle annusetase on 3.
Kuva kummagi valiku ridade arv. Sorteeri teine valik Diff järgi kahanevalt.

Vihje: ridade arvu saad len(tabel) abil. Enesekontroll: kontrolli, et iga valitud rida vastab mõlemale tingimusele. Sorteeritud tabelis peab iga järgmine Diff-väärtus olema eelmisest väiksem või sellega võrdne.


# Kirjuta siia oma kood. Vajaduse korral lisa lahtreid.
     
Kirjuta siia oma vastus või põhjendus.

P4. Uus veerg ja puuduvad väärtused

.copy() loob tabelist koopia, mida saad muuta algtabelit muutmata. Uue veeru lisamiseks kirjuta omistamise vasakule poolele tabeli nimi ja nurksulgudesse uus veerunimi, näiteks andmed["arvutatud_muutus"]. Paremale poole kirjuta arvutus.

Kahe veeru lahutamisel leitakse siin iga rea jaoks pärast- ja enneskoori vahe. Eraldi Pythoni tsüklit pole vaja.

Dokumentatsioon: copy.


# Töökoopia loomine algandmeid muutmata.
andmed = algandmed.copy()

# Arvuline veerg: pärast- ja enneskoori vahe.
andmed["arvutatud_muutus"] = andmed["Mem_Score_After"] - andmed["Mem_Score_Before"]

# Tõeväärtusveerg: kas skoor suurenes?
andmed["skoor_suurenes"] = andmed["Diff"] > 0
display(andmed[["Mem_Score_Before", "Mem_Score_After", "Diff", "arvutatud_muutus", "skoor_suurenes"]].head())
     
Puuduvate väärtuste loendamine koosneb kahest sammust:

.isna() annab iga tabeliväärtuse kohta tõeväärtuse: True, kui väärtus puudub, ja False, kui see on olemas.
Sellele järgnev .sum() liidab tõeväärtused igas veerus. True läheb arvesse ühena ja False nullina, seega saad iga veeru puuduvate väärtuste arvu.
Puuduv väärtus tähendab, et andmed on teadmata või sisestamata. See ei ole sama mis arv 0. Enne eemaldamist või täitmist selgita välja, millised read muutuksid ja kuidas see analüüsi mõjutab.

Allpool on eraldi näidistabel, kus üks vanus puudub. .dropna(subset=["vanus"]) jätab kõrvale ainult puuduva vanusega read. Seda võib kasutada analüüsis, mis vajab teadaolevat vanust; arvesta, et osa kirjeid jääb siis analüüsist välja.

Dokumentatsioon: isna, sum, dropna.


# isna() märgib puuduvad väärtused; sum() loendab need veergude kaupa.
display(algandmed.isna().sum())

# Eraldi näidistabel, milles üks vanus puudub.
naide = pd.DataFrame({"nimi": ["Mari", "Jaan"], "vanus": [24, None]})
display(naide)

# dropna(): puuduva vanusega ridade väljajätmine.
display(naide.dropna(subset=["vanus"]))
     
Ülesanne P-03

Loo tabelist algandmed koopia. Lisa sellesse veerg muutus_vahemalt_10: väärtus on True, kui Diff >= 10, ja muul juhul False. Loenda tingimusele vastavad read. Kontrolli ka puuduvate Diff-väärtuste arvu.

Vihje: tõeväärtusveeru .sum() loendab True-väärtusi. Enesekontroll: kas kasutad õiget veerunime ja kas piirväärtus 10 on kaasatud? Selgita, miks False ei tähenda puuduvat väärtust.


# Kirjuta siia oma kood. Vajaduse korral lisa lahtreid.
     
Kirjuta siia oma vastus või põhjendus.

P5. Rühmade kokkuvõte

groupby("Drug") koondab sama ravimikoodiga read ühte rühma. Sellele järgnev .agg() arvutab iga rühma kohta soovitud kokkuvõtted.

Kirjes keskmine_muutus=("Diff", "mean") on keskmine_muutus loodava veeru nimi. Sulgudes olev ennik määrab, millisest veerust väärtused võtta ("Diff") ja milline arvutus teha ("mean" ehk keskmine).

mean arvutab keskmise ja median mediaani. Puuduvad väärtused jäetakse neist arvutustest välja.
size loendab kõik rühma read.
count loendab valitud veeru olemasolevad väärtused. Puuduva väärtusega rida selle arvu sisse ei lähe.
Lisa keskmise kõrvale nii ridade arv kui ka kasutatud väärtuste arv. Nii näed rühma suurust ja seda, kui paljude väärtuste põhjal keskmine arvutati.

Dokumentatsioon: groupby, agg, size, count.


# groupby() ja agg(): rühmade kokkuvõtted.
kokkuvote = algandmed.groupby("Drug").agg(
    keskmine_muutus=("Diff", "mean"),
    mediaan=("Diff", "median"),
    ridu=("Diff", "size"),
    skooriga_ridu=("Diff", "count"),
).reset_index()  # Rühmitamistunnus tagasi tavaliseks veeruks.

# round(): ümardatud tulemuse kuvamine algset kokkuvõtet muutmata.
display(kokkuvote.round(2))
     
Pärast rühmitamist on ravimikood kokkuvõttetabeli indeksis. .reset_index() teeb sellest tavalise veeru Drug ning loob uue reaindeksi alates nullist.

.round(2) tagastab tabeli, mille arvväärtused on ümardatud kahe komakohani. Näites kuvame selle tulemuse; muutujas kokkuvote säilivad ümardamata väärtused.

Siin annavad size ja count sama tulemuse, sest veerus Diff pole puuduvaid väärtusi. Allolevas väikeses näites erinevad need arvud.

Dokumentatsioon: reset_index, round.


# Näidistabel: rühmas A on üks skoor puudu.
puuduvusega = pd.DataFrame({"ruhm": ["A", "A", "B"], "skoor": [5, None, 8]})

# size loendab kõik read; count ainult olemasolevad skoorid.
display(puuduvusega.groupby("ruhm").agg(ridu=("skoor", "size"), skooriga_ridu=("skoor", "count")))
     
Rühmade läbimine for-tsükliga

groupby() tagastab GroupBy-objekti, mida saad läbida for-tsükliga. Igal sammul saad kaks väärtust:

ravimikood on rühma võti, siin veeru Drug väärtus;
ruhma_tabel on selle rühma kõiki ridu ja algseid veerge sisaldav DataFrame.
Näites kuvame iga ravimirühma suuruse ja kaks suurima skoorimuutusega kirjet. Sortimine ja ridade valimine toimuvad iga rühma sees eraldi.

sort_values() argument key määrab funktsiooni, mida rakendatakse veerule enne järjestamist. Siin kasutab key=abs absoluutväärtusi; tabelis säilivad algsed märgiga väärtused.

Tsükkel sobib siis, kui tahad iga rühmaga teha mitu toimingut, näiteks uurida selle ridu, koostada graafiku või salvestada eraldi faili. Tavalise kokkuvõttetabeli, näiteks rühmade keskmiste ja suuruste leidmiseks kasuta .agg()-i.

Dokumentatsioon: rühmade läbimine, sort_values ja key.


# Rühmade läbimine: igal sammul rühma võti ja sellele vastav alamtabel.
for ravimikood, ruhma_tabel in algandmed.groupby("Drug"):
    print(f"Ravimirühm {ravimikood}: {len(ruhma_tabel)} kirjet")

    # Selle rühma kahe absoluutväärtuselt suurima muutuse valimine.
    suurimad = ruhma_tabel.sort_values("Diff", key=abs, ascending=False).head(2)
    display(suurimad[["Mem_Score_Before", "Mem_Score_After", "Diff"]])
     
Ülesanne P-04

Rühmita algandmed annusetaseme (Dosage) järgi. Leia iga rühma keskmine Diff ja ridade arv. Millise rühma keskmine on suurim? Mida üks kokkuvõttetabeli rida tähistab?

Enesekontroll: kui liidad kokku iga rühma ridade arvu, pead saama algtabeli ridade arvu. Põhjenda, miks see tabel üksi ei tõesta annuse põhjuslikku mõju.


# Kirjuta siia oma kood. Vajaduse korral lisa lahtreid.
     
Kirjuta siia oma vastus või põhjendus.

P6. Tulemuse salvestamine

Salvesta kokkuvõte CSV-faili. index=False jätab Pandase reaindeksi failist välja, nii et CSV-sse lähevad ainult tabeli veerud. Sama nimega faili salvestamine kirjutab varasema sisu üle. Loe fail pärast salvestamist uuesti sisse ja kontrolli selle sisu.

Dokumentatsioon: to_csv.


# Failitee koostamine ja kausta loomine.
kaust = Path("valjund")
kaust.mkdir(exist_ok=True)
fail = kaust / "ravimiruhmade_kokkuvote.csv"

# CSV salvestamine ilma Pandase reaindeksita.
kokkuvote.to_csv(fail, index=False)
print("Salvestatud:", fail.resolve())

# Salvestatud faili uuesti lugemine sisu kontrollimiseks.
display(pd.read_csv(fail))
     
Ülesanne P-05

Vasta tekstilahtris:

Mille poolest erinevad .shape ja .head()?
Millal annavad size ja count eri tulemuse?
Miks on filtris (algandmed["age"] > 30) & (algandmed["Drug"] == "A") mõlemad tingimused sulgudes?
Enesekontroll: leia iga vastuse juurde sobiv näide põhiosast.


# Kirjuta siia oma kood. Vajaduse korral lisa lahtreid.
     
Kirjuta siia oma vastus või põhjendus.

Põhiosa on läbitud. Edasi liigu Seaborni vihikusse. Vajaduse korral võrdle oma vastuseid lahenduskäikudega.

Järgmised peatükid on lisamaterjal. Nende läbimine ei ole Seaborni vihiku põhiosa ega lõpuülesande eelduseks.

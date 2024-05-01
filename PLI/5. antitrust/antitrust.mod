# DATI
param nFiliali; # Numero delle filiali
set filiali := 1..nFiliali; # Insieme delle filiali
param nProdotti; # Numero dei prodotti
set prodotti := 1..nProdotti; # Insieme dei prodotti
param fatturato{filiali, prodotti}; # Fatturato di ogni filiale per ogni prodotto
param nAzienda := 2;
set azienda := 1..nAzienda;
# VARIABILI
var x{filiali, azienda} binary; # Variabile binaria per ogni possibile assegnamento filiale-azienda figlia
var z; # Differenza di fatturato
# VINCOLI
subject to assegnamentoFiliale {f in filiali} :
  sum{a in azienda} x[f, a] = 1;
subject to valAssoluto1 {p in prodotti} :
  z >= sum{f in filiali} fatturato[f, p]*x[f, 1] - sum{f in filiali} fatturato[f, p]*x[f, 2];
subject to valAssoluto2 {p in prodotti} :
  z >= sum{f in filiali} fatturato[f, p]*x[f, 2] - sum{f in filiali} fatturato[f, p]*x[f, 1];
# FUNZIONE OBIETTIVO
minimize differenza : z; # Problema del valore assuluto
#############
data;
param nFiliali := 7;
param nProdotti := 3;
param fatturato : 1  2  3 :=
1                83 14 42
2                38 63 56
3                28 24 12
4                59  7 53 
5                25 35 83
6                52 86 85
7                59 64 25
;
end;
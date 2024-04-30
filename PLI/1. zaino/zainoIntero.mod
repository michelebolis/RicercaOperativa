# DATI
param nOggetti; # Numero di oggetti 
set oggetti := 1..nOggetti; # Insieme degli oggetti
param volume{oggetti}; # Volume che occupa l'oggetto
param valore{oggetti}; # Valore dell'oggetto
param capacita; # Capacita dello zaino
# VARIABILI
var x{oggetti} integer >=0; # Variabile intera che indica quanti oggetti vengono scelti
# VINCOLI
subject to vincoloCapacita :
  sum{o in oggetti} x[o] * volume[o] <= capacita;
# FUNZIONE OBIETTIVO
maximize valoreTotale : sum{o in oggetti} x[o] * valore[o];
#########
data;
param nOggetti := 12;
param capacita := 300;
param : volume valore :=
1 41 16
2 39 19
3 45 19
4 28 12
5 56 22
6 58 29
7 37 18
8 63 26
9 49 22
10 33 14
11 42 19
12 52 25;
end;
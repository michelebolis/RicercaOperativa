# DATI
param nGiorni; # Numero dei giorni considerati
set Giorni := 1..nGiorni; # Insieme dei giorni
param nElettrodomestici; # Numero degli elettrodomestici
set Elettrodomestici := 1..nElettrodomestici; # Insieme degli elettrodomestici
param Consumi{Giorni}; # Consumi in KWh per ogni giorno
param Tempi{Giorni, Elettrodomestici}; # Tempi di funzionamento di ogni elettrodomestico in un giorno
# VARIABILI
var x{Elettrodomestici} >=0; # Potenza assorbita per ogni elettrodomestico
var a{Giorni}; # Approssimazione nella lettura del contatore
var err; # Media errori in valore assoluto
# VINCOLI
subject to Approssimazione {g in Giorni}:
  a[g] = Consumi[g] - sum{e in Elettrodomestici} Tempi[g, e] * x[e];
# FUNZIONE OBIETTIVO
# B) minimizzare il valore assoluto del valor medio degli errori
minimize MassimoErrore : err; 
subject to Errore1: err >=  (sum {g in Giorni} err)/nGiorni;
subject to Errore2: err >= -(sum {g in Giorni} err)/nGiorni;
#########
data;
param nGiorni := 12;
param nElettrodomestici := 8;
param Consumi :=
1  10
2  20 
3  10
4  15
5   5
6  10
7  10
8  20
9  12
10 25
11  2 
12  5
;
param Tempi : 1   2   3   4   5   6   7   8 :=
1            0.2 0.4 0.5 0.6 0.6 0.5 0.2 0.2
2            0.1 1.0 0.1 1.2 1.1 1.0 0.6 0.3
3            0.1 0.5 0.5 0.7 0.5 0.5 0.1 0.2 
4            0.2 0.6 0.6 0.8 0.6 0.6 0.2 0.3
5            0.1 0.4 0.2 0.3 0.2 0.2 0.0 0.2
6            0.2 0.5 0.4 0.7 0.5 0.4 0.2 0.3
7            0.3 0.4 0.5 0.8 0.4 0.4 0.2 0.2
8            0.6 0.8 1.0 1.5 1.3 0.6 0.5 0.6
9            0.3 0.4 0.5 0.7 0.5 0.5 0.3 0.2
10           0.5 0.9 1.1 1.3 0.9 1.2 0.8 0.5
11           0.0 0.2 0.0 0.0 0.1 0.0 0.0 0.1
12           0.0 0.5 0.2 0.3 0.2 0.1 0.1 0.3
;
end;
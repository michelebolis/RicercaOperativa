# DATI
param nOrigini; # Numero delle origini
set origini := 1..nOrigini; # Insieme delle origini
param nDestinazioni; # Numero delle destinazioni
set destinazioni := 1..nDestinazioni; # Insieme delle destinazioni
param costi{origini, destinazioni}; # Costi di trasporto unitari da un origine a una destinazione
param offerta{origini}; # Offerta di ogni origine
param domanda{destinazioni}; # Domanda per ogni destinazione
# VARIABILI
var x{origini, destinazioni} >= 0; # Quantita da spedire da ogni origine a ogni destinazione
# VINCOLI
subject to vincoloDomanda {d in destinazioni} :
  sum{o in origini} x[o, d] = domanda[d];
subject to vincoloOfferta {o in origini} :
  sum{d in destinazioni} x[o, d] <= offerta[o];
# FUNZIONE OBIETTIVO
minimize costiTotali : sum{o in origini, d in destinazioni} costi[o, d] * x[o, d];
###########
data;
param nOrigini := 8;
param nDestinazioni := 4;
param costi : 1  2  3  4 :=
1            20 25 30 28
2            15 12 32 26
3            18 41 36 37
4            32 23 35 20
5            31 40 19 38
6            33 22 34 21
7            25 29 26 27
8            30 24 39 28
;
param offerta :=
1 30
2 40
3 20
4 35
5 40
6 30
7 25
8 50
;
param domanda :=
1 70
2 70
3 50
4 80
;
end;
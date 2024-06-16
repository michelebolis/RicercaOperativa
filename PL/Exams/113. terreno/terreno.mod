# DATI
param base; # Lunghezza della base del rettangolo
set Base := 1..base; # Insieme delle celle sulla base
param altezza; # Lunghezza dell'altezza del rettangolo
set Altezza := 1..altezza; # Insieme delle celle sull'altezza
param livello{Altezza, Base}; # Livello iniziale delle celle
param costo; # Costo unitario di spostamento
param M := sum {a in Altezza, b in Base} livello[a, b] / (base * altezza);
# VARIABILI
var x{Altezza, Base, Altezza, Base} >= 0; # Quanto sposto da una cella ad un altra
# VINCOLI
subject to livellamento{a in Altezza, b in Base} :
  livello[a, b] + sum{a2 in Altezza, b2 in Base} x[a2, b2, a, b] - sum{a2 in Altezza, b2 in Base} x[a, b, a2, b2] = M;
# FUNZIONE OBIETTIVO
minimize costiTotali : costo * sum{a in Altezza, b in Base, a2 in Altezza, b2 in Base} (x[a, b, a2, b2] * sqrt((a - a2) ^ 2 + (b - b2) ^ 2));
#############
data;
param base := 20;
param altezza := 10;
param costo := 0.5;
param livello : 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 :=
1 -5 -4 -3 -2 -1 0 -1 -1 -1 0 1 1 1 2 3 4 3 3 4 5
2 -5 -4 -3 -2 -1 0 0 0 0 1 2 1 0 1 2 3 2 2 3 4
3 -4 -3 -3 -2 -1 0 1 0 1 0 1 0 -1 0 1 2 1 1 2 3
4 -4 -3 -2 -2 -1 0 1 0 1 1 1 0 -1 -1 0 1 0 0 1 2
5 -3 -2 -2 -2 -1 0 1 0 1 1 1 1 0 0 1 0 -1 -1 0 1
6 -2 -2 -2 -1 -1 0 1 1 1 2 2 2 1 0 0 -1 -2 -2 -1 0
7 -1 -1 -1 0 0 1 2 2 2 3 3 3 2 1 0 -1 -2 -3 -2 -1
8 0 0 -1 0 1 2 3 3 3 4 4 4 3 2 1 0 -1 -2 -3 -2
9 1 1 0 1 2 3 4 4 4 5 5 5 4 3 2 1 0 -1 -2 -3
10 2 2 1 2 3 4 5 5 5 6 6 6 5 4 3 2 1 0 -1 -2
;
end;

# DATI
param nMansioni; # Numero di mansioni
set mansioni := 1..nMansioni; # Insieme delle mansioni
param nPersone := nMansioni; # Numero di persone
set persone := 1..nPersone; # Insieme delle persone
param costo{persone, mansioni}; # Costo di attribuzione di una mansione a una persone
# VARIABILI
var x{persone, mansioni} binary; # Indica se la perona è assegnata alla mansione
# VINCOLI
subject to assegnamentoPersona {p in persone} : sum{m in mansioni} x[p, m] = 1;  
subject to assegnamentoMansione {m in mansioni} : sum{p in persone} x[p, m] = 1;  
# FUNZIONE OBIETTIVO
minimize costiTotali : sum{p in persone, m in mansioni} x[p, m] * costo[p, m];
###########
data;
param nMansioni := 10;
param costo : 1 2 3 4 5 6 7 8 9 10 :=
1            35 24 62 57 81 34 36 12 63 24
2            72 25 42 25 64 14 24 74 84 15
3            48 37 62 14 56 94 51 76 11 21
4            26 26 73 83 15 89 89 24 44 53
5            32 26 37 26 15 37 24 61 54 13
6            37 37 76 3 47 51 25 383 61 50
7            59 98 94 26 47 73 51 54 51 48
8            60 54 65 50 45  6 82 33 61 72
9            62 42 68 74 73 12 36 37 38 50
10            2 52 62 38 95 60 88 25 26 84
;
end;
# Il risultato del risolutore è ottimo MA non unico. 
# Considerando che tutti i contenitori hanno la stessa capacita, allora  ogni loro permutazione genera una soluzione
# DATI
param nOggetti; # Numero degli oggetti
set Oggetti := 1..nOggetti; # Insieme degli oggetti
param nContenitori; # Numero dei contenitori
set Contenitori := 1..nContenitori; # Insieme dei contenitori
param capacita; # Capacita totali dei contenitori
param peso{Oggetti}; # peso in Kg di ogni oggetti
# VARIABILI
var x{Contenitori} binary; # Indica SE utilizzo  il contenitore
var y{Oggetti, Contenitori} binary; # Indica SE l'oggetto è nel contenitore fissato
# VINCOLI
subject to Utilizzo {o in Oggetti} :
  sum{c in Contenitori} y[o, c] = 1;
subject to VincoloCapacita {c in Contenitori} :
  sum{o in Oggetti} y[o, c] * peso[o] <= capacita * x[c];
# FUNZIONE OBIETTIVO
minimize utilizzoContenitori : sum{c in Contenitori} x[c]; 
#############
data;
param nOggetti := 20;
param nContenitori := 5;
param capacita := 700;
param peso :=
1  144
2  172
3  153
4  131
5  126
6  109
7  165
8  149
9  108
10  84
11 199
12 160
13 182
14 129
15 107
16 161
17 130
18 167
19 128
20 94
;
end;
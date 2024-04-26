# DATI 
param nP; # numero prodotti
param nF; # numero fornitori
set P := 1..nP; # insieme dei prodotti
set F := 1..nF; # insieme dei fornitori
param b{P}; # limitazione per ciascun prodotto
param c{F}; # profitto unitario
param a{F, P}; # % di utilizzo 
# VARIABILI 
var x{F} >= 0;
# VINCOLI
subject to Consumi{p in P} :
 sum{f in F} a[f, p] * x[f] <= b[p];
# OBIETTIVO
maximize z : sum{f in F} c[f] * x[f];
#########
data;
param nP := 3;
param nF := 2;
param b := 
1 6000
2 4000
3 8000
;
param c := 
1 0.02
2 0.03
;
param a : 1   2   3 :=
1        0.2 0.2 0.3
2        0.3 0.1 0.3
;
end;
##########
# Soluzione ottima non unica perche x[1] è fuori base
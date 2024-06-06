# model atomi.mod; option solver snopt; solve;
reset;
# DATI
param nAtomi;
set Atomi := 1..nAtomi;
param x{Atomi};
param y{Atomi};
param z{Atomi};
set Parametri;
param parametri{Parametri, Atomi};
# VARIABILI
var X >= 0;
var Y >= 0; 
var Z >= 0;
var r{a in Atomi} = sqrt((X - x[a])^2 + (Y - y[a])^2 + (Z - z[a])^2);
var energia = sum{a in Atomi} ((parametri["A", a]/r[a]^12) - (parametri["B", a]/r[a]^6));
# VINCOLI
# FUNZIONE OBIETTIVO
minimize energiaTotale : energia;
#############
data;
param nAtomi := 10;
param : x y z :=
1 3.2 2.5 4.8
2 2.1 3.7 8.4
3 7.5 2.5 5.0
4 6.6 1.2 4.5
5 0.8 5.1 5.6
6 6.3 8.8 3.5
7 2.4 1.0 3.1
8 1.2 4.6 9.0
9 8.5 7.8 1.5
10 4.1 9.3 0.9
;
set Parametri := A B;
param parametri : 1 2 3 4 5 6 7 8 9 10 :=
A 1.0 1.1 2.1 3.0 0.5 0.2 0.8 1.1 1.5 1.7
B 200 400 320 250 400 200 120 300 100 500
;
end;
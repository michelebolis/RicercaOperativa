# model sigmoidev3.mod; option solver snopt; solve;
# a = 2.18415
# b = 23.8284
# c = 15.5987
# d = 0.905082
reset;
# DATI
param nOsservazioni; # Numero delle osservazioni
set Osservazioni := 1..nOsservazioni; # Insieme delle osservazioni
param x{Osservazioni}; # Coordinate x osservate
param y{Osservazioni}; # Coordinate y osservate
# VARIABILI
var a; 
var b;
var c;
var d; 
var f{o in Osservazioni} = c + b * ((exp((x[o] - a) / d)) / ((1 + exp((x[o] - a) / d)) )) ;
# VINCOLI
# FUNZIONE OBIETTIVO
# minimizzare l’errore quadratico medio
minimize z3 : sum{o in Osservazioni} ((y[o] - f[o])^2) / nOsservazioni;
#############
data;
param nOsservazioni = 12;
param : x y :=
1 2 28
2 1 20
3 8 40
4 5 36
5 -6 16
6 -2 16
7 0 16
8 -3 16
9 7 40
10 6 40
11 -4 16
12 3 32
;
var a := 2;
var b := 24;
var c := 15;
var d := 1; 
end;
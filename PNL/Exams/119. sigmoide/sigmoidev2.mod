# model sigmoidev2.mod; option solver snopt; solve;
# a = 2.3963
# b = 24.0891
# c = 15.9502
# d = 0.873215
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
var err{Osservazioni};
# VINCOLI
subject to errore1{o in Osservazioni} :
  err[o] >= y[o] - f[o];
subject to errore2{o in Osservazioni} :
  err[o] >= f[o] - y[o];
# FUNZIONE OBIETTIVO
# minimizzare la somma degli errori in valore assoluto;
minimize z2 : sum{o in Osservazioni} err[o];
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
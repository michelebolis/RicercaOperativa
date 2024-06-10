# model sigmoide.mod; option solver snopt; solve;
# a = 2.05047
# b = 24.6076
# c = 14.4206
# d = 1.06784
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
var maxErr;
# VINCOLI
subject to errore1{o in Osservazioni} :
  maxErr >= y[o] - f[o];
subject to errore2{o in Osservazioni} :
  maxErr >= f[o] - y[o];
# FUNZIONE OBIETTIVO
# minimizzare il massimo errore in valore assoluto;
minimize z1 : maxErr;
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
reset;
# ampl: model tunnel.mod;
# ampl: option solver snopt;
# ampl: solve;
# La soluzione calcolata dal solutore è ottima poiché il problema è convesso: ciascuna delle distanze di un punto
# dalla retta, infatti, è una funzione convessa delle variabili e la somma di funzioni convesse è sua volta convessa.
# DATI
param nPiazze; # Numero delle piazze
set Piazze := 1..nPiazze; # Insieme delle piazze
param X{Piazze}; # Vettore delle coordinate x delle piazze
param Y{Piazze}; # Vettore delle coordinate y delle piazze
# VARIABILI
var a := 1; # Coefficiente a della retta
var b := 0; # Coefficiente b della retta
var c := 3; # Coefficiente c delle retta
var delta{Piazze}; # Distanza tra la piazza fissata e la retta
# VINCOLI
subject to Normalizzazione : a^2 + b^2 = 1;
subject to LinearizzazioneModulo1 {p in Piazze} :
  delta[p] >= -a*X[p]-b*Y[p]-c;
subject to LinearizzazioneModulo2 {p in Piazze} :
  delta[p] >= a*X[p]+b*Y[p]+c;
# FUNZIONE OBIETTIVO
# OSS il denominatore non cambia
minimize distanze : sum{p in Piazze} delta[p];
#############
data;
param nPiazze := 12;
param : X  Y :=
1      -10 14
2      -8  7
3      -5  10
4      -3  10
5        0  9
6        2  8
7        5  8
8        8  7
9        9  5
10      11  6
11      14  7
12      16  5
;
end;
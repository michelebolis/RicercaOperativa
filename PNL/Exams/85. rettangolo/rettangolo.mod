reset;
# ampl: model rettangolo.mod;
# ampl: option solver snopt;
# ampl: solve;
# DATI
param nPunti; # Numero dei punti
set Punti := 1..nPunti; # Insieme dei punti
param x{Punti}; # Vettore delle coordinate x dei punti
param y{Punti}; # Vettore delle coordinate y dei punti
set Rette := 0..3; # Insieme delle rette
# VARIABILI
var a{Rette}; # Vettore del parametro a delle rette
var b{Rette}; # Vettore del parametro b delle rette
var c{Rette}; # Vettore del parametro c delle rette
var L1 >= 0; # Lunghezzza del lato1
var L2 >= 0; # Lunghezzza del lato2
# Definizione lati
subject to Lato1: L1 = c[0] + c[2];
subject to Lato2: L2 = c[1] + c[3];
# VINCOLI
subject to Normalizzazione {r in Rette} : a[r]^2 + b[r]^2 = 1;
subject to Perpendicolarita : a[0] * a[1] + b[0] * b[1] = 0;
subject to Antiparallele {r in Rette: r <= 1}:
  a[r] * a[r+2] + b[r] * b[r+2] = -1;
subject to Interno {r in Rette, p in Punti} : a[r] * x[p] + b[r] * y[p] + c[r] >= 0;
# FUNZIONE OBIETTIVO
minimize area : L1 * L2;
#############
data;
param nPunti := 10;
param : x y :=
1 -7 -2
2 -3 5
3 -4 -5
4 10 5
5 11 2
6 6 9
7 0 -6
8 -6 2
9 9 0
10 -7 0
;
var : a b c :=
0 1 1 1
1 2 2 2
2 3 3 3
3 4 4 4
;
end;
reset;
# ampl: model passerelle.mod;
# ampl: option solver knitro;
# ampl: solve;
# DATI
param nPunti; # Numero dei punti
set Punti := 1..nPunti; # Insieme dei punti
param nSnodi; # Numero di snodi
set Snodi := 1..nSnodi; # Insieme degli snodi
param x{Punti}; # Vettori delle coordinate x dei punti
param y{Punti}; # Vettori delle coordinate y dei punti
# VARIABILI
var X{Snodi}; # Vettori delle coordinate x degli snodi
var Y{Snodi}; # Vettori delle coordinate y degli snodi
var z{Punti, Snodi} binary; # z[p,s] = 1 SE il punto p è collegato allo snodo s
var distanzaPS{p in Punti} = sum{s in Snodi} z[p, s] * sqrt((x[p]-X[s])^2 + (y[p]-Y[s])^2);
var distanzaSS{s in Snodi : s > 1} = sqrt((X[s-1]-X[s])^2 + (Y[s-1]-Y[s])^2);
# VINCOLI
subject to Collegamento {p in Punti} :
  sum{s in Snodi} z[p, s] >= 1;
# FUNZIONE OBIETTIVO
minimize lunghezzaTotale : sum{s in Snodi : s > 1} distanzaSS[s] + sum{p in Punti} distanzaPS[p];
#############
data;
param nPunti := 10;
param nSnodi := 3;
param : x y :=
1 0 1
2 0 3
3 3 7
4 5 9
5 9 9
6 11 8
7 11 7
8 11 4
9 8 1
10 6 1
;
end;
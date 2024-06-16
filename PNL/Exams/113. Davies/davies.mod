reset;
# model davies.mod; option solver knitro; solve;
# DB = 0.18114

# DATI
param nPunti; # Numero dei punti
set Punti := 1..nPunti; # Insieme dei punti
param K; # Numero dei cluster
set Cluster := 1..K; # Insieme dei cluster
param x{Punti}; # Coordinate x dei punti
param y{Punti}; # Coordinate y dei punti

# VARIABILI
var X{Punti, Cluster} binary; # Indica SE il punto appartiene al cluster
var T{k in Cluster} = sum{p in Punti} X[p, k]; # Numerosita del cluster
var xCentroide{k in Cluster} = sum{p in Punti} (X[p, k] * x[p])/ T[k]; # Coordinate x del centroide per ogni cluster
var yCentroide{k in Cluster} = sum{p in Punti} (X[p, k] * y[p])/ T[k]; # Coordinate y del centroide per ogni cluster
var S{k in Cluster} = sqrt(sum{p in Punti} (X[p, k] * ((xCentroide[k] -  x[p]) ^ 2 + (yCentroide[k] - y[p]) ^ 2)) / T[k]);
var M{h in Cluster, k in Cluster : h<>k} = sqrt((xCentroide[k] - xCentroide[h]) ^ 2 + (yCentroide[k] - yCentroide[h]) ^ 2);
var maxR{h in Cluster} = max{k in Cluster : k<>h} ((S[h] + S[k]) / M[h, k]);
# VINCOLI
subject to appartenenza{p in Punti} :
  sum{c in Cluster} X[p, c] = 1;
# FUNZIONE OBIETTIVO
minimize DB : (sum{k in Cluster} maxR[k]) / nPunti;
#############
data;
param nPunti := 20;
param K := 5;
param : x y :=
1 24 9
2 16 33
3 8 32
4 42 31
5 40 45
6 41 89
7 13 71
8 37 64
9 34 66
10 50 58
11 91 43
12 68 27
13 63 29
14 61 45
15 54 50
16 62 79
17 65 75
18 80 81
19 85 67
20 51 56
;
param X : 1   2   3   4   5  := # Inizializzazione con soluzione ottima
1    0   1   0   0   0
2    0   1   0   0   0
3    0   1   0   0   0
4    0   1   0   0   0
5    0   1   0   0   0
6    0   0   0   0   1
7    0   0   0   0   1
8    0   0   0   0   1
9    0   0   0   0   1
10   0   0   0   1   0
11   1   0   0   0   0
12   1   0   0   0   0
13   1   0   0   0   0
14   0   0   0   1   0
15   0   0   0   1   0
16   0   0   1   0   0
17   0   0   1   0   0
18   0   0   1   0   0
19   0   0   1   0   0
20   0   0   0   1   0
;
end;
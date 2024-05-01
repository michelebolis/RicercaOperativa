# DATI
param nPiazze; # Numero delle piazze
set piazze := 1..nPiazze; # Insieme delle piazze
set vie within (piazze cross piazze); # Strade da una piazza a un altra
# VARIABILI
var x{piazze} binary; # Indica se c è una sentinella nella piazza
# VINCOLI
subject to copertura{i in piazze}:
  sum{(i,j) in vie} x[j] + sum{(j,i) in vie} x[j] >= 1;
# FUNZIONE OBIETTIVO
minimize nSentinelle : sum{p in piazze} x[p];
#############
data;
param nPiazze := 30;
set vie :=
1 2 
1 3 
1 4
2 30
3 13
3 16
4 5
4 6
4 24
5 6
5 8
5 13
6 7
7 9
7 10
8 9
8 12
8 13
8 27
9 10
9 27
10 11
11 23
11 29
12 13
12 18
12 19
12 27
13 14
14 15
14 18
15 16
15 17
18 19
18 28
19 20
19 28
20 21
20 22
20 29
24 25
24 26
27 29
;
end;
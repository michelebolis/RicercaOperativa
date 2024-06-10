# DATI
param nRighe; # Numero righe
set Righe := 1..nRighe; # Insieme delle righe
param nColonne; # Numero delle colonne
set Colonne  := 1..nColonne; # Insieme delle colonne
param griglia{Righe, Colonne}; # Matrice della domanda 
param nColonnine; # Numero di tipi di Colonnine
set Colonnine := 1..nColonnine; # Insieme delle colonnine
param capacita{Colonnine}; # Vettore delle capacita per ogni tipo di colonnina
param costo{Colonnine}; # Vettore del costo per ogni tipo di colonnina
param budget;
# VARIABILI
# Demand from node 1 served by node 2 (adjacent nodes only)
var x {r1 in Righe, c1 in Colonne, r2 in Righe, c2 in Colonne} >=0; 
var y {Righe, Colonne, Colonnine} binary;
# VINCOLI
subject to vincoloBudget :
  sum{c in Colonnine, r in Righe, co in Colonne} y[r, co, c] * costo[c] <= budget;
subject to Max_capacity {r2 in Righe, c2 in Colonne}: # rende x integer
  sum {r1 in Righe, c1 in Colonne} x[r1, c1, r2, c2] = sum {co in Colonnine} capacita[co] * y[r2, c2, co];
subject to Domanda {r1 in Righe, c1 in Colonne}:
  sum {r2 in Righe, c2 in Colonne} x[r1,c1,r2,c2] <= griglia[r1, c1];
subject to singolaColonnina {r2 in Righe, c2 in Colonne}:
  sum {co in Colonnine} y[r2, c2, co] <= 1;
subject to Adjacent {r1 in Righe, c1 in Colonne, r2 in Righe, c2 in Colonne: abs(r1-r2)>1 or abs(c1-c2)>1}:
  x[r1, c1, r2, c2] = 0;
# FUNZIONE OBIETTIVO
# Massimizzare l'efficacia
maximize served_demand: sum {r1 in Righe, c1 in Colonne, r2 in Righe, c2 in Colonne} x[r1, c1, r2, c2];
#############
data;
param nRighe := 16;
param nColonne := 9; 
param griglia : 1 2 3 4 5 6 7 8 9 :=
1 0 0 2 0 0 0 1 0 1
2 1 0 0 0 0 1 0 0 0
3 0 1 0 2 0 0 0 0 0
4 1 0 0 0 0 1 0 0 0
5 0 0 1 0 0 0 0 0 2
6 1 0 0 0 0 1 0 0 0
7 0 0 0 1 0 0 0 0 0
8 0 1 0 0 0 0 0 0 1
9 0 0 0 1 0 2 0 0 0
10 0 0 0 0 0 0 0 0 1
11 1 1 0 0 0 0 0 0 0
12 0 0 0 1 0 2 0 0 1
13 1 0 0 0 0 0 0 0 0
14 0 0 0 1 0 1 0 1 0
15 1 0 0 0 0 0 0 0 1
16 1 0 2 0 0 0 2 0 0
;
param nColonnine := 2;
param : capacita costo :=
1 1  50
2 3 100
;
param budget := 1200;
end;
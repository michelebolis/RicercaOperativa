# DATI 
param nL; # Numero di lotti
param nC; # Numero di cereali
set L:=1..nL; # Insieme dei lotti
set C:=1..nC; # Insieme dei cereali
param p{C}; # Profitti unitari [€/q]
param a{L}; # Acri disponibili per lotto
param acqua; # Acqua Disponibile
param consumo_acqua{C}; # Consumo di acqua per cereale
param consumo_terreno{L, C}; # Matrice che indica il consumo di terreno per produrre una quintale 

# VARIABILI
var x{L, C} >= 0;

# VINCOLI
subject to Consumi_Terreno{l in L} :
 sum{c in C} consumo_terreno[l, c] * x[l, c] <= a[l];

subject to Consumi_Acqua{l in L} :
 sum{c in C} consumo_acqua[c] * x[l, c] <= acqua;
 
# OBIETTIVO
maximize z : sum{c in C} p[c] * sum {l in L} x[l, c];

###########
data;
param nL := 2;
param nC := 6;
param a := 
1 200
2 400
;
param p :=
1 48
2 62
3 28
4 36
5 122
6 94
;
param consumo_acqua :=
1 120
2 160
3 100 
4 140
5 215
6 180
;
param consumo_terreno :  1    2     3    4      5    6   :=
1                      0.02 0.03  0.02  0.016 0.05 0.04 
2                      0.02 0.034 0.024 0.02  0.06 0.034 
;
param acqua := 400000;
end;
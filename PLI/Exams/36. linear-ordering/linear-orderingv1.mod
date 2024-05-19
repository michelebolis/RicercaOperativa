# La soluzione è ottima ma non è garantita essere unica
# 
# DATI
param nNodi; # Numero di nodi del grafo
set Nodi := 1..nNodi; # Insieme dei nodi
param pesi{Nodi, Nodi}; # Matrice dei pesi degli archi
# VARIABILI
var x{Nodi, Nodi} binary; # Indica se l'arco fa parte del grafo
# VINCOLI
subject to VincoloNodi{i in Nodi, j in Nodi : i < j} : 
  x[i,j] + x[j, i] = 1;
subject to Aciclicita{i in Nodi, j in Nodi, k in Nodi : (i < j) and (i < k) and (j!=k)} : 
  x[i, j] + x[j, k] + x[k, i] <= 2;
# Cicli di ordine 3
# FUNZIONE OBIETTIVO
minimize z : sum{i in Nodi, j in Nodi} x[i, j] * pesi[i, j];
#############
data;
param nNodi := 7;
param pesi : 1 2 3 4 5 6 7 :=
1 0  68  81  23  45  20  37
2 12   0  25  51  57  89  78
3 34  27   0  12   9  71  20
4 95  55  42   0   8  23  44
5 60  60  51  34   0   2  40
6 93  22  48  45  24   0  77
7 75  64  36  25  16  21   0
;
end;

# DATI
param nUtenti; # Numero degli utenti
set utenti := 1..nUtenti; # Insieme degli utenti
param nLuoghi; # Numero dei luoghi
set luoghi := 1..nLuoghi; # Insieme dei luoghi
param erogazione{utenti, luoghi}; # Indica se il servizio puo essere erogato all utente da quel luogo
param costi{luoghi}; # Costo di erogazione del servizio da quel luogo
# VARIABILI
var x{luoghi} binary; # Da quale luogo erogare il servizio
# VINCOLI
subject to vincoloErogazione {u in utenti} : sum{l in luoghi} x[l] * erogazione[u,l] >= 1;
# FUNZIONE OBIETTIVO
minimize costiTotali : sum{l in luoghi} costi[l] * x[l];
#######
data;
param nUtenti := 5;
param nLuoghi := 10;
param erogazione : 1 2 3 4 5 6 7 8 9 10 :=
1                  1 0 0 0 1 1 1 0 1  1
2                  0 0 0 1 1 0 0 0 1  0
3                  0 0 0 0 1 1 0 0 0  0 
4                  0 0 0 0 0 0 1 1 1  0
5                  1 1 1 0 0 0 0 1 1  1
;
param costi := 
1  205 
2  311
3  450
4  274
5  321
6  469
7  327
8  631
9  750
10 400
;
end;

# DATI
set N; # Insieme dei nodi
param M := 999;
set Archi := N cross N; # Insieme delle coppie di nodi che formano un arco
param rischio{Archi} default M; # Vettore dei rischi deigli archi
# VARIABILI
var x{Archi} binary; # Indica SE l'arco fa parte del cammino
# VINCOLI
# Grado uscente e entrante di ogni nodi deve essere uguale tranne per il nodo iniziale e finale
subject to Cammino {j in N diff {0, 'f'}} :
  sum{(i, j) in Archi} x[i, j] = sum{(j, i) in Archi} x[i, j];
subject to Uscente0 :
  sum{(i, j) in Archi : i = 0} x[i, j] = 1
;
subject to Uscentef :
  sum{(i, j) in Archi : i = 'f'} x[i, j] = 0
;
subject to Entrantef :
  sum{(i, j) in Archi : j = 'f'} x[i, j] = 1
;
subject to Entrante0 :
  sum{(i, j) in Archi : j = 0} x[i, j] = 0
;
# FUNZIONE OBIETTIVO
minimize rischioTotale : sum{(i, j) in Archi} x[i, j] * rischio[i, j];
#############
data;
set N := 0 1 2 3 4 5 6 7 8 9 a b c d e f;
param rischio :=
[0, 1] 2
[0, 3] 1
[1, 2] 2
[2, 3] 2
[2, 4] 3
[3, 5] 2
[3, 6] 2
[4, 5] 3
[4, 9] 2
[4, a] 4
[5, 7] 3
[6, 7] 2
[7, 8] 2
[8, 9] 2
[8, b] 1
[9, d] 5
[a, d] 3
[b, c] 1
[b, e] 2
[c, d] 2
[d, e] 3
[d, f] 3
[e, f] 4
;
end;
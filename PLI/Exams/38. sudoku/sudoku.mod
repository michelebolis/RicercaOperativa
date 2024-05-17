# DATI
set Posizioni := 1..9; # Insieme delle posizioni di righe/colonne/numeri
param fix {Posizioni, Posizioni, Posizioni} binary default 0; # Cifre fissate in input
set MacroR := 1..3;
# VARIABILI
var x{r in Posizioni, c in Posizioni, n in Posizioni} binary >= fix[r, c, n]; # Assegnamento alla riga, colonna del numero
# VINCOLI
# Per ogni riga, una sola volta un numero
subject to VincoloRiga {r in Posizioni, numero in Posizioni} :
  sum{c in Posizioni} x[r, c, numero] = 1;
# Per ogni colonna, una sola volta un numero
subject to VincoloColonna {c in Posizioni, numero in Posizioni} :
  sum{r in Posizioni} x[r, c, numero] = 1;
# Per ogni (colonna, riga) un numero
subject to VincoloNumero {r in Posizioni, c in Posizioni} :
  sum{numero in Posizioni} x[r, c, numero] = 1;
# Per ogni macroarea, una sola volta un numero
subject to Quadrato {r in MacroR, c in MacroR, numero in Posizioni}:
  sum {i in Posizioni, j in Posizioni: (i>=(r-1)*3+1) and (i<=r*3) and (j>=(c-1)*3+1) and (j<=c*3)} x[i, j, numero] = 1;

#############
data;
param fix :=
[1, 1, 1] 1
[1, 4, 2] 1
[2, 1, 2] 1
[2, 5, 3] 1
[3, 3, 4] 1
[3, 6, 1] 1
[4, 3, 3] 1
[4, 6, 5] 1
[4, 9, 6] 1
[5, 2, 7] 1
[5, 8, 4] 1
[6, 1, 8] 1
[6, 4, 9] 1
[6, 7, 2] 1
[7, 1, 9] 1
[7, 4, 8] 1
[7, 7, 7] 1
[8, 2, 3] 1
[8, 5, 9] 1
[8, 8, 1] 1
[9, 3, 2] 1
[9, 5, 6] 1
[9, 9, 5] 1
;
end;

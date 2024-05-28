# ampl: model elettrodotto.mod;
# ampl: option solver snopt;
# ampl: solve;
reset;
# DATI
param limit; # Limite di distanza massima
param nPaesi; # Numero dei paesi
set Paesi := 1..nPaesi; # Insieme dei paesi
param x{Paesi}; # Vettore delle coordinate x per ogni paese
param y{Paesi}; # Vettore delle coordinate y per ogni paese
param predecessore{Paesi}; # Vettore dei predecessori per ogni paese
param epsilon := 0.2; # Valore per inizializzazione
# VARIABILI
var xcabina{p in Paesi} >=0 := x[p] + epsilon;
var ycabina{p in Paesi} >=0 := y[p] + epsilon;
var distanzaCabina{p in Paesi} = 
  if (xcabina[p] - x[p])^2 + (ycabina[p] - y[p])^2 = 0 then 0
  else sqrt((xcabina[p] - x[p])^2 + (ycabina[p] - y[p])^2)
; 
var distanzaDaPredecessore{p in Paesi} = 
  if (xcabina[p] - xcabina[predecessore[p]])^2 
   + (ycabina[p] - ycabina[predecessore[p]])^2 = 0 then 0
  else 
  sqrt((xcabina[p] - xcabina[predecessore[p]])^2 
     + (ycabina[p] - ycabina[predecessore[p]])^2)
;
# VINCOLI
subject to Max{p in Paesi } : 
  distanzaCabina[p] <= limit;
# FUNZIONE OBIETTIVO
minimize zTizio : sum{p in Paesi} distanzaCabina[p];
# minimize zCaio : sum{p in Paesi} distanzaDaPredecessore[p];
#############
data;
param nPaesi := 16;
param : x y predecessore :=
1	0	0  1
2	4	8  1
3	10	12 2
4	15	12 3
5	22	28 4
6	31	30 5
7	40	34 6
8	42	46 7
9	50	50 8
10	25	15 9
11	32	15 10
12	37	10 11
13	46	13 12
14	31	38 13
15	28	45 14
16	35	54 15
;
param limit := 2;

end;
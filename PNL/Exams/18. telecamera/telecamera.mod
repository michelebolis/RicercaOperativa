reset;
# DATI
param nQuadri; # Numero dei quadri
set Quadri := 1..nQuadri; # Insieme dei quadri
param xa {Quadri}; # Vettore delle x del primo punto
param ya {Quadri}; # Vettore delle y del primo punto
param xb {Quadri}; # Vettore delle x del secondo punto
param yb {Quadri}; # Vettore delle y del secondo punto
param delta; # Minimo distanza dalla parete
param L;
param c {q in Quadri} := sqrt((xa[q] - xb[q]) ^ 2 + (ya[q] - yb[q]) ^ 2);

# VARIABILI
var xP >= delta, <= L - delta, := L/2;
var yP >= delta, <= L - delta, := L/2;
var a {q in Quadri} = sqrt((xP - xa[q]) ^ 2 + (yP - ya[q]) ^ 2);
var b {q in Quadri} = sqrt((xP - xb[q]) ^ 2 + (yP - yb[q]) ^ 2);
var alfa {Quadri} >= 0, <= 3.14;
var alfamin;
# VINCOLI
# FUNZIONE OBIETTIVO
# Tizio: massimizzare somma degli angoli
#maximize zTizio: sum {q in Quadri} alfa[q];
# Caio: massimizzare angolo minimo
maximize zCaio: alfamin;
subject to Maxmin {q in Quadri}: alfamin <= alfa[q];
#############
data;
param nQuadri := 3;
param delta := 1;
param L := 16;
param:  xa  ya  xb  yb :=
1        0   0   0   4
2        0  10   6  16
3       10   0  15   0
;
end;
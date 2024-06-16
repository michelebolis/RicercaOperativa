reset;
# model volo.mod; option solver knitro; solve;
# costoTotale = 27.65375407;
# DATI
param nAeroporti; # Numero degli aeroporti
set Aeroporti := 1..nAeroporti; # Insieme degli aeroporti
param x {Aeroporti}; # Coordinate x degli aeroporti
param y {Aeroporti}; # Coordinate y degli aeroporti
param nStati; # Numero degli stati da attraversare
set Stati := 1..nStati; # Insieme degli stati
param costo {Stati}; # Costo unitario per attraversare uno stato
set Confini := 1..nStati-1; # Insieme dei confini
param nP1; # Numero dei punti di discontinuita del primo confine
param nP2; # Numero dei punti di discontinuita del secondo confine
set P1 := 1..nP1; # Insieme dei punti di discontinuita del primo confine
set P2 := 1..nP2; # Insieme dei punti di discontinuita del secondo confine
param xP1 {P1}; # Coordinate x dei punti di discontinuita del primo confine
param yP1 {P1}; # Coordinate y dei punti di discontinuita del primo confine
param xP2 {P2}; # Coordinate x dei punti di discontinuita del secondo confine
param yP2 {P2}; # Coordinate y dei punti di discontinuita del secondo confine 

# VARIABILI
var px1;
var py1;
var px2;
var py2;
var D1;
var D2;
var p1 {P1} binary;
var p2 {P2} binary;

subject to Determinante1 {i in P1: i <= nP1 - 1} :
	((xP1[i+1] - xP1[i]) * (py1 - yP1[i]) - (yP1[i+1] - yP1[i]) * (px1 - xP1[i])) * p1[i] = 0;
subject to Binary1 : sum {i in P1: i <= nP1 - 1} p1[i] = 1;
subject to Binary2 : p2[1] = 1;	
subject to Determinante2 {i in P2: i <= nP2 - 1}:
	((xP2[i+1] - xP2[i]) * (py2 - yP2[i]) - (yP2[i+1] - yP2[i]) * (px2 - xP2[i])) * p2[i] = 0;
	
subject to XMaggiore1 {i in P1: i <= nP1 - 1}:
	px1 * p1[i] >= min(xP1[i], xP1[i+1]) * p1[i];
subject to XMinore1 {i in P1: i <= nP1 - 1}:
	px1 * p1[i] <= max(xP1[i], xP1[i+1]) * p1[i];
subject to YMaggiore1 {i in P1: i <= nP1 - 1}:
	py1 * p1[i] >= min(yP1[i], yP1[i+1]) * p1[i];
subject to YMinore1 {i in P1: i <= nP1 - 1}:
	py1 * p1[i] <= max(yP1[i], yP1[i+1]) * p1[i];

subject to XMaggiore2 {i in P2: i <= nP2 - 1}:
	px2 * p2[i] >= min(xP2[i], xP2[i+1]) * p2[i];
subject to XMinore2 {i in P2: i <= nP2 - 1}:
	px2 * p2[i] <= max(xP2[i], xP2[i+1]) * p2[i];
subject to YMaggiore2 {i in P2: i <= nP2 - 1}:
	py2 * p2[i] >= min(yP2[i], yP2[i+1]) * p2[i];
subject to YMinore2 {i in P2: i <= nP2 - 1}:
	py2 * p2[i] <= max(yP2[i], yP2[i+1]) * p2[i];
# OBIETTIVO
minimize costoTotale: sqrt((x[1] - px1) ^ 2 + (y[1] - py1) ^ 2) * costo[1] + 
            sqrt((px1 - px2) ^ 2 + (py1 - py2) ^ 2) * costo[2] + 
            sqrt((px2 - x[2]) ^ 2 + (py2 - y[2]) ^ 2) * costo[3];
######################
data;
param nAeroporti := 2;
param:  x  y :=
1       5 20
2      25  8;
param nStati := 3;
param costo :=
1		1.5
2		0.8
3		1.4;

param nP1 := 5;
param nP2 := 2;
param: xP1 yP1 :=
1        0  14
2        8  14
3       15  19
4       17  23
5       17  30
;
param: xP2 yP2 :=
1       10   0
2       30  20
;
end;
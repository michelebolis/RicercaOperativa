reset;
# ampl: model tripartizionev1.mod;
# ampl: option solver snopt;
# ampl: solve;
# xx = -1.2509e-08 = 0
# yy = -2.1944e-08 = 0
# z1 = 6.38012e-16 = 0
#         a             b            c          
# 0    0.923002       0.384794    1.99897e-08
# 1   -0.601432       0.798924    1.00083e-08
# 2    7.31472e-09   -1          -2.19442e-08
# DATI
param nSottoinsiemi; # Numero dei sottoinsiemi
set Sottoinsiemi := 0..nSottoinsiemi - 1; # Insieme dei sottoinsiemi
param nPunti{Sottoinsiemi}; # Vettore dei numeri di punti in ogni sottoinsieme
set Punti {s in Sottoinsiemi} := 1..nPunti[s]; # Insieme dei punti in ogni sottinsieme
param x {s in Sottoinsiemi, Punti[s]}; # Ascissa di ogni punto
param y {s in Sottoinsiemi, Punti[s]}; # Ordinata di ogni punto
# VARIABILI
var xx := 0;
var yy := 0;
var a {Sottoinsiemi};
var b {Sottoinsiemi};
var c {Sottoinsiemi};
# VINCOLI
subject to Normalizzazione {s in Sottoinsiemi}:
  a[s] ^ 2 + b[s] ^ 2 = 1;
subject to Passaggio {s in Sottoinsiemi}:
  a[s] * xx + b[s] * yy + c[s] = 0;
subject to Dx {s in Sottoinsiemi, p in Punti[s]}:
  a[s] * x[s, p] + b[s] * y[s, p] + c[s] >= 0;
# dato un sottoinsieme, il vincolo è che il successivo abbia i punti nella "direzione"  opposta rispetto alla sua
subject to Sx {s in Sottoinsiemi, p in Punti[(s+1) mod nSottoinsiemi]}:
  a[s] * x[(s+1) mod nSottoinsiemi, p] + b[s] * y[(s+1) mod nSottoinsiemi, p] + c[s] <= 0;
# FUNZIONE OBIETTIVO
# origine il piu possibile vicino all’origine degli assi Cartesiani
#  la funzione obiettivo da minimizzare `e convessa ed il minimo `e unico.
minimize z1: xx ^ 2 + yy ^ 2;
# origine il piu possibile lontano all’origine degli assi Cartesiani
# possono esistere minimi locali, poich ́e si massimizza una funzione obiettivo convessa
# maximize z1: xx ^ 2 + yy ^ 2;
#############
data;
param nSottoinsiemi := 3;
param nPunti := 
0	8
1	6
2	12
;

param x(tr) :	0	1	2 :=
1				-5	-10	-3
2				10	-4	-1
3				5	-19	1
4				3	-11	-2
5				-1	-7	11
6				-2	-12	2
7				2	.	3
8				10	.	0
9				.	.	1
10				.	.	2
11				.	.	-3
12				.	.	-4;

param y(tr) :	0	1	2 :=
1				12	2	-6
2				8	3	-8
3				5	15	-5
4				0	0	-9
5				3	-3	-1
6				9	-9	-9
7				10	.	0
8				6	.	-2
9				.	.	-8
10				.	.	-2
11				.	.	-6
12				.	.	-9;

param: 	a		b		c :=
0		0.7    -0.7	    0
1		0		1		0
2	   -0.7    -0.7	    0;
end;
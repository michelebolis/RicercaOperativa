reset;
# Dato che k e f(K) non sono direttamente confrontabili, utilizzerei il Criterio del punto di massima curvatura
# Notiamo infatti come f(K) diminuisca in modo abbastanza lineare fino al passaggio da 5 a 6 il cui miglioramento (diminuzione) è molto inferiore
# Il k ideale risulta quindi essere k = 5
# k    z
# 0 90264.5
# 1 71733.6
# 2 53001.1
# 3 38265.8
# 4 25968.3
# 5 15513.3
# 6 13917.4
# DATI
param nCoppie; # Numero di coppie x, y
set Coppie := 1..nCoppie; # Insieme delle coppie
param x{Coppie}; # Vettore delle coordinate x
param y{Coppie}; # Vettore delle coordinate y
param k; # outliers da scartare
# VARIABILI
var m; # Coefficiente della retta
var q; 
var out{Coppie} binary; # 1 SE il punto è da non considerare
var err{c in Coppie} = (y[c] - (m * x[c] + q)) ^ 2;
# VINCOLI
subject to vincoloK : sum{c in Coppie} out[c] <= k;
# FUNZIONE OBIETTIVO
minimize z : sum{c in Coppie} (1 - out[c]) * err[c];
#############
data;
param nCoppie := 40;
param k := 5;
param : x y :=
1 12 324
2 16	309
3 21	342
4 25	337
5 28	385
6 29	431
7 32	427
8 35	407
9 36	395
10 38	578
11 43	502
12 44	431
13 45	462
14 49	486
15 50	515
16 51	642
17 52	515
18 53	540
19 54	547
20 56	547
21 59	554
22 62	587
23 67	556
24 68	612
25 69	579
26 71	641
27 72	509
28 73	622
29 74	620
30 75	511
31 76	635
32 77	659
33 78	632
34 79	632
35 86	661
36 87	698
37 91	572
38 92	702
39 95	717
40 98	753
;
end;
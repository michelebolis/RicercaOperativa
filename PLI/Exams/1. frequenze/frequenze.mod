# DATI
param nFrequenze;
set Frequenze := 1..nFrequenze;
param val{Frequenze};
param k;
# VARIABILI
var x{Frequenze} binary;
# VINCOLI
subject to Incompatibili {f1 in Frequenze, f2 in Frequenze : (val[f1] > val[f2]) and (val[f1] - val[f2] < k)} :
  x[f1] + x[f2] <= 1;
# FUNZIONE OBIETTIVO
maximize frequenzeAttive : sum{f in Frequenze} x[f];
#############
data;
param nFrequenze := 22;
param k := 5;
param val :=
1 101
2 103
3 105
4 107
5 109
6 110
7 112
8 114
9 116
10 118
11 121
12 124
13 125
14 128
15 129
16 132
17 133
18 134
19 135
20 136
21 138
22 140
;
end;
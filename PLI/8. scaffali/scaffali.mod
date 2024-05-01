# DATI
param nLibri; # Numero dei libri
set libri := 1..nLibri; # Insieme dei libri
param larghezza{libri}; # Larghezza del libro
param altezza{libri}; # Altezza del libro
param nScaffali; # Numero degli scaffali
set scaffali := 1..nScaffali; # Insieme degli scaffali
param larghezzaLibreria;
# VARIABILI
var x{libri, scaffali} binary; # Indica se il libro è presente nello scaffale
var H{scaffali} >= 0; # Indica l altezza dello scaffale
# VINCOLI
subject to vincoloLibri {l in libri} :
  sum{s in scaffali} x[l, s] = 1;
subject to vincoloAltezza {s in scaffali} :
  sum{l in libri} altezza[l] * x[l, s] = H[s];
subject to vincoloLarghezza {s in scaffali}  :
  sum{l in libri} larghezza[l] * x[l, s] <= larghezzaLibreria;
# FUNZIONE OBIETTIVO
minimize altezzaTot : sum{s in scaffali} H[s];
#############
data;
param nLibri := 15;
param nScaffali := 15;
param larghezzaLibreria := 50;
param larghezza :=
1  10
2  22
3  20 
4   5
5   8
6   7
7  15
8  11
9   9
10 10
11  2
12  3
13 12
14  5
15  1
;
param altezza :=
1   2
2  20
3  10
4  10
5   8
6  12
7  18
8   9
9  15
10 13
11  8
12  7
13  7 
14 10
15  5
;
end;
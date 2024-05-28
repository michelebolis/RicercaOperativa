reset;
# DATI
# ampl: model classificatore.mod;
# ampl: option solver knitro;
# ampl: solve;
param n; # Numero dei nodi
set N := 1..n; # Insieme dei nodi
param x{N}; # Vettore delle coordinate x dei nodi
param y{N}; # Vettore delle coordinate y dei nodi
param tag{N}; # Vettore dei tag dei nodi
# Upper bound dato dalla distanza massima tra due punti
param M := max{i in N, j in N} (sqrt((x[i] - x[j])^2 + (y[i] - y[j])^2));
# VARIABILI
var a := -0.707107;
var b := 0.707107;
var c := -21.2132;
var w{N} binary; # w = 0 SE outlier
var delta >= 0; # Differenza in valore assoluto
# VINCOLI
# il vincolo assicura che la retta non sia degenere (cioè, non coincida con un punto o una linea parallela all'asse x o y) e 
# abbia una direzione ben definita
subject to Normalizzazione : a^2 + b^2 = 1;
subject to SeparazioneV {i in N : tag[i] = 1} :
  a*x[i] + b * y[i] + c <= - delta + M * w[i];
subject to SeparazioneF {i in N : tag[i] = 0} :
  a*x[i] + b * y[i] + c >= + delta - M * w[i];
# FUNZIONE OBIETTIVO
subject to N_outliners : sum{i in N} w[i] <= 5; # 5 ricavato da minimize z2
maximize massimaSeparazione : delta;
# minimize z2 : sum{i in N} w[i];
#############
data;
param n := 20;
param : x y tag :=
  1    12   29     1
  2    16   26     1
  3    24   25     1
  4     8    7     1
  5    30   50     1
  6    11   41     1
  7     5    2     1
  8     6   11     1
  9    40   12     1
 10    23   27     1
 11    21   43     1
 12    51   18     1
 13     2   36     0
 14     2   33     0
 15    11    6     0
 16    33    7     0
 17    28   45     0
 18    25   42     0
 19    20   50     0
 20    20   18     0
;
end;
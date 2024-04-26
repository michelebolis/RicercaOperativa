# DATI
set tipiBenzina; # Insieme  dei tipi di benzina
set Sostanze; # Insieme delle sostanze
param barili{Sostanze}; # Vettore del numero di barili massimi giornalieri per sostanza
param costi{Sostanze}; # Vettore dei costi unitari per barile della sostanza
param ricavi{tipiBenzina}; #  Ricavi unitari per tipi di benzina
param lowerBounds{Sostanze, tipiBenzina}; # SE non specificato = 0
param upperBounds{Sostanze, tipiBenzina}; # SE non specificato = 1
# VARIABILI
var x{Sostanze, tipiBenzina} >=0; # Barili di ogni sostanza in ogni tipo di benzina
var y{s in Sostanze} >= 0, <= barili[s]; # Barili totali consumata per ogni sostanza
var z{tipiBenzina} >=0; # Barili totali prodotti per ogni benzina 
# VINCOLI
# Vincolo sulle quantita di barili di sostane utilizzabili
subject to limiteBariliUsati{s in Sostanze} : 
  sum {t in tipiBenzina} x[s, t] = y[s];
subject to limiteBariliProdotti{t in tipiBenzina} : 
  sum {s in Sostanze} x[s, t] = z[t];
# Vincoli dei lower bound
subject to Limite_minimo {i in Sostanze, j in tipiBenzina}:
  x[i,j] >= lowerBounds[i,j] * z[j];
# Vincoli degli upper bound
subject to Limite_massimo {i in Sostanze, j in tipiBenzina}:
  x[i,j] <= upperBounds[i,j] * z[j];
# FUNZIONE OBIETTIVO
maximize profitti : sum{b in tipiBenzina} z[b] * ricavi[b] - sum{s in Sostanze} y[s] * costi[s];

############
data;
set tipiBenzina := super normale verde;
set Sostanze := A B C D;
param barili := 
A 3000
B 2000
C 4000
D 1000
;
param costi :=
A 3
B 6
C 4
D 5
;
param ricavi :=
super   5.5
normale 4.5
verde   3.5
;
param lowerBounds:	super	normale	verde :=
A					0.0		0.0		0.0
B					0.4		0.1		0.0
C					0.0		0.0		0.0
D					0.0		0.0		0.0;

param upperBounds:	super	normale	verde :=
A					0.3		0.5		0.7
B					1.0		1.0		1.0
C					0.5		1.0		1.0
D					1.0		1.0		1.0;
end;
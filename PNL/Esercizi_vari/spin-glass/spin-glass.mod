# DATI
param n;
set N := 1..n;  # Insieme delle particelle
param e {i in N, j in N : i<j};

# VARIABILI
var x {N} binary; # spin

# FUNZIONE OBIETTIVO
minimize Energia : 
  sum {i in N, j in N: i<j} - e[i,j] * (2*x[i] - 1) * (2*x[j] - 1);

#############
data;
param n := 10;
param e : 1  2  3  4  5  6  7  8  9 10 :=
 1		  .  3 -1 -4  5 -8  4 -2 -3 -1
 2		  .  . -2  2 -4  7 -1  2 -2  2
 3		  .  .  . -3 -3 -3  5 -2 -1 -3
 4		  .  .  .  .  2 -1 -2 -2 -2 -7
 5		  .  .  .  .  .  3 -7  7 -2  8
 6	  	  .  .  .  .  .  . -5  3 -3 -1
 7		  .  .  .  .  .  .  . -1  9 -5
 8		  .  .  .  .  .  .  .  .  1  9
 9		  .  .  .  .  .  .  .  .  . -6
10  	  .  .  .  .  .  .  .  .  .  .
;

end;
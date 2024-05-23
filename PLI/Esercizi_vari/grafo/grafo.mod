# Cammino da un nodo s a t
# Uso variabile binaria per ogni i, j negli archi
# Vincoli sum i,j in A x[i,j] = sum j,i in A x[j, i] per ogni j!=s!=t
param n; # Numero dei nodi
set N := 0..n-1; # Insieme dei nodi
param costo{i in N, j in N : i <> j}; # Vettore dei costi degli archi
# Ciclo hamiltoniano
# per ogni i in N, sum i,j in A x[i, j] = 1
# per ogni i in N, sum j,i in A x[j, i] = 1
# per ogni S sottoinsieme non vuoti N, sum i, j in A(S) x[i, j] <= |S| - 1
set SS := 0..2^n - 1; # Insieme dei possibili sottoinsiemi
set S {k in SS} := {i in N : (k div 2^i) mod 2 = 1};
# VARIABILI
var x{i in N, j in N : i <> j} binary;
subject to GradoEntrante{j in N} : 
  sum{i in N : i <> j} x[i, j] = 1;
subject to GradoUscente{i in N} : 
  sum{j in N : i <> j} x[i, j] = 1;
subject to Vincolo {k in SS diff {0, 2^n-1}} :
  sum{i in S[k], j in S[k] : i <> k} x[i, j] <= card(S[k]) - 1;
# FUNZIONE OBIETTIVO
minimize z : sum{i in N, j in N : i <> j} costo[i, j] * x[i, j];
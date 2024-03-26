# DATI
set C ;
param budget;
param q{C};
# VARIABILI
var x{C} >=0;
var y >= 0; # Vincita minima
# VINCOLI
subject to Soldi :
 sum{c in C} x[c] <= budget;

# Vincoli per linearizzare la f.o. max-min [€]
subject to Linearizzazione {c in C}:
  y <= q[c] * x[c];
# OBIETTIVO

maximize z : y; 
########
data;
param budget := 57;
set C := Fulmine Freccia Dardo Lampo;
param q :=
Fulmine 3
Freccia 4
Dardo   5
Lampo   6
;
end;
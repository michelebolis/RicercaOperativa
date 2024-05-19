# Conviene uscire dalla porta Est in quanto ha una probabilita di essere scoperti dello 0.224868
# DATI
set Stati;
param f {Stati,Stati};
# VARIABILI
var P {Stati} >=0;
# VINCOLI
subject to Bilanciamento {s in Stati}:
  P[s] = sum {t in Stati} f[t,s] * P[t];
subject to Normalizzazione:
  sum {s in Stati} P[s] = 1;
#############
data;
set Stati := Nord Est Sud Ovest;
param f : Nord Est  Sud  Ovest :=
Nord      0.00 0.40 0.00 0.60
Est       0.20 0.00 0.80 0.00
Sud       0.00 0.50 0.00 0.50
Ovest     0.75 0.00 0.25 0.00
;

end;
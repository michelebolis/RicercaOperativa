# DATI
param nOggetti; # Numero di oggetti 
set oggetti := 1..nOggetti; # Insieme degli oggetti
param volume{oggetti}; # Volume che occupa l'oggetto
param valore{oggetti}; # Valore dell'oggetto
param capacita; # Capacita dello zaino
# VARIABILI
var x{oggetti} binary; # Variabile binaria che indica se viene scelto o meno l oggetto
# VINCOLI
subject to vincoloCapacita :
  sum{o in oggetti} x[o] * volume[o] <= capacita;
# FUNZIONE OBIETTIVO
maximize valoreTotale : sum{o in oggetti} x[o] * valore[o];
#########
data;
param nOggetti := 10;
param capacita := 100;
param volume :=
1   8
2   9
3  13
4  24
5  28
6  36
7  41
8  57
9  68
10 70
;
param valore :=
1   4
2   6
3  40
4  15
5  20 
6  20 
7  21
8  38
9  46
10 56
;

end;
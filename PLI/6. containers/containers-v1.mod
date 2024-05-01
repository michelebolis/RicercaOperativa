# DATI
param nOggetti; # Numero di oggetti
set oggetti := 1..nOggetti; # Insieme degli oggetti
param peso{oggetti}; # Peso dell'oggetto
param nContainers; # Numero di containers
set containers := 1..nContainers; # Insieme dei containers
param capacita; # Capacita dei containers
# VARIABILI
var x{containers} binary; # Indica se il container viene utilizzato
var y{oggetti, containers} binary; # Indica in quale container viene stipato l'oggetto
# VINCOLI
subject to vincoloOggetti {o in oggetti} :
  sum{c in containers} y[o, c] = 1;
subject to vincoloCapacita {c in containers} :
  sum{o in oggetti} y[o, c] * peso[o] <= capacita  * x[c];
# FUNZIONE OBIETTIVO
minimize utilizzoContainers : sum{c in containers} x[c];
#############
data;
param nOggetti := 15;
param peso :=
1  10
2  24
3  18
4   7
5   7
6   6
7  16
8  11
9   8
10 11
11  1 
12  6 
13 15
14  8 
15  2
;
param nContainers := 4;
param capacita := 50;
end;
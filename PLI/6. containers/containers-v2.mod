# DATI
param nOggetti; # Numero di oggetti
set oggetti := 1..nOggetti; # Insieme degli oggetti
param peso{oggetti}; # Peso dell'oggetto
param volume{oggetti}; # Volume dell'oggetto
param nContainers; # Numero di containers
set containers := 1..nContainers; # Insieme dei containers
param capacitaPeso; # Capacita peso dei containers
param capacitaVolume; # Capacita volume dei containers
# VARIABILI
var x{containers} binary; # Indica se il container viene utilizzato
var y{oggetti, containers} binary; # Indica in quale container viene stipato l'oggetto
# VINCOLI
subject to vincoloOggetti {o in oggetti} :
  sum{c in containers} y[o, c] = 1;
subject to vincoloPeso {c in containers} :
  sum{o in oggetti} y[o, c] * peso[o] <= capacitaPeso * x[c];
subject to vincoloVolume {c in containers} :
  sum{o in oggetti} y[o, c] * volume[o] <= capacitaVolume * x[c];
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
param volume :=
1 260
2 140
3 190
4 220
5 180
6 250
7 170
8 200
9 140
10 170
11 190  
12 230
13 230
14 180
15 250
;
param nContainers := 4;
param capacitaPeso := 50;
param capacitaVolume := 1000;
end;
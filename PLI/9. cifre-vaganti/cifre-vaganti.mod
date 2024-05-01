# DATI
param nCifre; # Numero delle cifre del numero
set cifre := 1..nCifre; # Insieme delle cifre
param Numeri; # Numeri possibili
set numeri := 1..Numeri;
param somma; # Somma risultante
# VARIABILI
var x{numeri, cifre} binary; # Indica quale numero c è ad ogni cifra nel numero originale
var y{numeri, cifre} binary; # Indica quale numero c è ad ogni cifra nel numero modificato
var X >= 0; # Numero iniziale
var Y >= 0; # Numero modificato
# VINCOLI
subject to vincoloCifre1 {c in cifre} :
  sum{n in numeri} x[n, c] = 1;
subject to vincoloCifre2 {c in cifre} :
  sum{n in numeri} y[n, c] = 1;
subject to numeriDiversi {n in numeri} :
  sum{c in cifre} x[n, c] <= 1;
subject to vincoloSomma : X + Y = somma;
subject to cifra1 : sum{n in numeri} n * x[n, 3] = sum{n in numeri} n * y[n, 1];
subject to cifra2 : sum{n in numeri} n * x[n, 4] = sum{n in numeri} n * y[n, 2];
subject to cifra3 : sum{n in numeri} n * x[n, 2] = sum{n in numeri} n * y[n, 3];
subject to cifra4 : sum{n in numeri} n * x[n, 1] = sum{n in numeri} n * y[n, 4];
subject to numeroIniziale : 
  X = sum{n in numeri, c in cifre} x[n, c]*n*10^(c-1);
subject to numeroModificato : 
  Y = sum{n in numeri, c in cifre} y[n, c]*n*10^(c-1);
# ATT NO funzione obiettivo perchè è un problema di esistenza e non di ottimizzazione
#############
data;
param nCifre := 4;
param Numeri := 9;
param somma := 8612;
end;
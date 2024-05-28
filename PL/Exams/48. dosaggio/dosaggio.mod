# SE il paziente  fosse allgerico al farmaco A, cio non comprometterebbe la soluzione in quanto non è previsto nel dosaggio
# Mentre per gli altri farmaci potremmo ridurre la quantita di rispettivamente B : 0.016761, C : 0.97895, D : 0.19579, E : 0.11208
# DATI
param nParametri; # Numero dei parametri
set Parametri := 1..nParametri; # Insieme dei parametri
set Farmaci; # Insieme dei farmaci
param parametroIniziale{Parametri}; # Vettore del valore iniziale dei parametri
param minimo{Parametri}; # Vettore delle soglie minime per ogni parametro
param massimo{Parametri}; # Vettore delle soglie massime per ogni parametro
param target{Parametri}; # Vettore delle valore desiderato per ogni parametro
param effetto{Parametri, Farmaci}; # Effetti dei farmaci su ogni parametro
param maxFarmaco{Farmaci}; # Vettore dei massimi dosaggi dei farmaci [mg]
# VARIABILI
var x{f in Farmaci} >=0 <= maxFarmaco[f]; # Quantita di farmaci da somministrare [mg]
var maxScostamento; # Massimo scostamento dei parametri |valore_ottenuto – valore_ideale|/|valore_max_consentito – valore_ideale|
# VINCOLI
subject to scostamento1 {p in Parametri} : 
  maxScostamento >= (parametroIniziale[p] + (sum{f in Farmaci} x[f] * effetto[p,  f]) - target[p])/(massimo[p] - target[p]);
subject to scostamento2 {p in Parametri} : 
  maxScostamento >= (target[p] - (sum{f in Farmaci} x[f] * effetto[p,  f]) - parametroIniziale[p] )/(target[p] - massimo[p]);
subject to vincoloMin {p in Parametri} :
  parametroIniziale[p] + sum{f in Farmaci} x[f] * effetto[p,  f] >= minimo[p];
subject to vincoloMax {p in Parametri} :
  parametroIniziale[p] + sum{f in Farmaci} x[f] * effetto[p,  f] <= massimo[p];
# FUNZIONE OBIETTIVO
minimize z : maxScostamento;
#############
data;
param nParametri := 7;
set Farmaci := A B C D E;
param : parametroIniziale  minimo target massimo :=
    1        3.45       7.0      12.0        15.0 
    2        1800      1700      2500        3500 
    3        0.05      0.50      0.80        1.30 
    4        3200      1400      2000        2750 
    5        26.4       8.0      10.0        12.0      
    6          35        28        35          41 
    7         136        80       120         160 
; 

param effetto :      A      B      C      D      E :=
    1              -0.2   +0.5   +0.7   +0.1   +0.2 
    2              -500    0.0   -250    +50    0.0 
    3              +0.2   -0.1   +0.3    0.0   +0.2 
    4               -80   -120    +15    -90   -100 
    5              -8.5   -7.0   -1.0   -3.0   +1.0 
    6                +5     -2     +8     -4      0 
    7                -5     -1     -2     -3     +4 
;
param maxFarmaco :=
   A          2.0 
   B          3.5 
   C          0.5 
   D          0.5 
   E          7.5
;
end;
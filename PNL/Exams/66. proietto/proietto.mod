reset;
# La soluzione trovata è ottima anche in senso globale perché il problema è convesso.
# ampl: model proietto.mod;
# ampl: option solver snopt; 
# ampl: solve;
# a = -0.025
# b = 1.63 
# c = 4
# x0 = -2.36799

# DATI
param nOsservazioni; # Numero delle osservazioni delle coordiante
set Osservazioni := 1..nOsservazioni; # Insieme delle osservazioni
param x{Osservazioni}; # Vettore delle coordinate x osservate
param y{Osservazioni}; # Vettore delle coordinate y osservate
# VARIABILI
var a <= 0; # Negativo perche il proiettile cade
var b;
var c;
var err{o in Osservazioni} = y[o] - (a * x[o] ^ 2 + b * x[o] + c);
var x0;
# VINCOLI
subject to Origine :
  a * x0 ^ 2 + b * x0 + c = 0;
subject to Sx :
  2 * a * x0 >= - b;
# FUNZIONE OBIETTIVO
minimize scartoQuadraticoMedio : sum{o in Osservazioni} err[o] ^ 2;
#############
data;
param nOsservazioni := 4;
param x := 
1 10   
2 20   
3 30   
4 40
;
param y := 
1 18  
2 26   
3 31   
4 29
;
end;
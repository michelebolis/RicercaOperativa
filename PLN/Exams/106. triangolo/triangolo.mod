reset;
# ampl: model triangolo.mod;
# ampl: option solver snopt;
# ampl: solve;
# DATI
param nPunti; # Numero dei punti
set Punti := 1..nPunti; # Insieme dei punti
set Vertici := 0..2; # Insieme dei vertici
param x{Punti}; # Vettore delle coordinate x dei punti
param y{Punti}; # Vettore delle coordinate y dei punti
# VARIABILI
var xx{Vertici}; # Vettore delle coordinate x dei vertici
var yy{Vertici}; # Vettore delle coordinate y dei vertici
var L := 20; # Lunghezza dei lati del triangolo
# Coefficienti della combinazione convessa
var lambda {Punti, Vertici} >=0;
# VINCOLI
subject to Equilatero {v in Vertici} : 
  L = ((xx[(v+1) mod 3] - xx[v])^2 + (yy[(v+1) mod 3] - yy[v])^2);
# I punti dati devono essere combinazioni convesse dei tre vertici
subject to Punti_coperti_x {i in Punti}:
  x[i] = sum {j in Vertici} lambda[i,j] * xx[j];
subject to Punti_coperti_y {i in Punti}:
  y[i] = sum {j in Vertici} lambda[i,j] * yy[j];
subject to Combinazione_convessa {i in Punti}:
  sum {j in Vertici} lambda[i,j] = 1;
# FUNZIONE OBIETTIVO
minimize lato : sqrt(L);
#############
data;
param nPunti := 5;
param : x  y :=
  1   24 -17
  2   15  14
  3   -2   0
  4   21  20
  5   18  -6
;
end;
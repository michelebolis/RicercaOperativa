# model accelleratore.mod; option solver snopt; solve;
# raggio := 25
reset;
# DATI
param x_lim_inf; # Limite inferiore per le ascisse del rettangolo
param x_lim_sup; # Limite superiore per le ascisse del rettangolo
param y_lim_inf; # Limite inferiore per le ordinate del rettangolo
param y_lim_sup; # Limite superiore per le ordinate del rettangolo
set Citta; # Insieme delle citta
param X{Citta}; # Coordinate x del centro della citta
param Y{Citta}; # Coordinate y del centro della citta
param R{Citta}; # Raggio della citta
set Cerchi := 1..2; # Insieme dei cerhi che formano l'accelleratore
# VARIABILI
var x{Cerchi};
var y{Cerchi};
var raggio = sqrt((x[1] - x[2])^2 + (y[1] - y[2])^2) / 2; 
# VINCOLI 
subject to NonTangenza1{c in Citta, cir in Cerchi} :
   sqrt((x[cir] - X[c])^2 + (y[cir] - Y[c])^2) >= raggio + R[c]; 
subject to limite_x_inf{c in Cerchi} : 
 x[c] >= (x_lim_inf + raggio);
subject to limite_x_sup{c in Cerchi} :
 x[c] <= (x_lim_sup - raggio);  
subject to limite_y_inf{c in Cerchi} :
 y[c] >= (y_lim_inf + raggio); 
subject to limite_y_sup{c in Cerchi} : 
 y[c] <= (y_lim_sup - raggio);;
# FUNZIONE OBIETTIVO
maximize grandezzaAccelleratore : raggio;
#############
data;
param x_lim_inf := -100; 
param x_lim_sup := 100;
param y_lim_inf := -50;
param y_lim_sup := 50; 
set Citta := A B C D E F G H I J K L M N O P;
param : X Y R := 
  A   -80  30   5 
  B   -87 -15   2 
  C   -81 -35   4 
  D   -59  25   4 
  E   -25 -30   4 
  F   -33 -15   2 
  G   -12   1   5 
  H    -6  43   5 
  I     0 -24   8 
  J    10  10   9 
  K    20 -15   2 
  L    30  25   2 
  M    41 -31  10 
  N    55  15   5 
  O    69 -10  10 
  P    80  28   9 
;

var x := 
1 -30 
2 -60
;
var y :=
1 25
2 15
;
end;
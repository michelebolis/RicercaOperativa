# DATI
param nPonti; # Numero dei ponti
set Ponti := 1..nPonti; # Insieme dei ponti
set Coppie; # Insieme delle coppie
param distanze{Coppie, Ponti}; # Matrice delle distanze per ogni coppia utilizzando ogni ponte
param nPontiCostruibili; # Numero di ponti costruibili
# VARIABILI
var x{Ponti} binary; # 1 SE il ponte viene costruito, 0 ALTRIMENTI
var y{Coppie, Ponti} binary; # 1 SE la coppia utilizza il ponte, 0 ALTRIMENTI
# VINCOLI
subject to vincoloCostruibili : sum{p in Ponti} x[p] <= nPontiCostruibili;
subject to pontiCostruiti {c in Coppie, p in Ponti}:
  x[p] >= y[c, p];
subject to utilizzoPonte{c in Coppie} : sum{p in Ponti} y[c, p] >= 1;
# FUNZIONE OBIETTIVO
# minimizzare la distanza media per ogni coppia
minimize distanzaMedia : sum{c in Coppie, p in Ponti} (y[c, p] * distanze[c, p]); # Sarebbe /5 ma il 5 � fisso
#############
data;
param nPonti := 4; 
param nPontiCostruibili := 2;
set Coppie := A B C D E;

param distanze : 1 2 3 4 :=
 A          12 14 20 24 
 B           9 17 23 27 
 C          18 10 12 16 
 D          25 15 15 15 
 E          26 16 10 10 
;
end;
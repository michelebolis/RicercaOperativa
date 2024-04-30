# DATI
param nOrbite; # Numero di orbite
set orbite := 1..nOrbite; # Insieme delle orbite
param nMemorie; # Numero dei dispositivi di memoria
set memorie := 1..nMemorie; # Insieme dei dispositivi di memoria
param input{orbite, memorie}; # Quantita di dati previste in ingresso [Mbit]
param durata{orbite}; # Durata delle finestra per la trasmissione [minuti]
param velocita; # Velocita di trasmissione dei dati [Mbit/minuti]
param capacita{memorie}; # Capcita iniziale dei dispositivi di memoria [Mbit]
param contenutoIniziale{memorie}; # Contenuto iniziale dei dispositii di memoria [Mbit]
# VARIABILI
var x{o in orbite, memorie} >= 0; # Quantita da scaricare in ogni orbita per ogni dispositivo
var y{orbite, m in memorie} >= 0 <= capacita[m]; # Quantita di dati nella memoria dopo le operazioni in ogni orbita
var z{o in orbite, m in memorie} >= 0; # Quantita di dati dopo la trasmissione prima dell'input
var w;
# VINCOLI
subject to vincoloTrasmissione {o in orbite, m in memorie : o>1} :
  z[o, m] = y[o-1, m] - x[o, m];
subject to vincoloTrasmissioneIniziale {m in memorie} :
  z[1, m] = contenutoIniziale[m] - x[1, m];
subject to vincoloConservazione {o in orbite, m in memorie} :
  y[o, m] = z[o, m] + input[o, m];
subject to vincoloVelocita {o in orbite} :
  sum{m in memorie} x[o, m] <= durata[o] * velocita;
# FUNZIONE OBIETTIVO
minimize obiettivo : w;
subject to maxz {o in orbite, m in memorie} :
  w >= y[o, m]/capacita[m];
###########
data;
param nOrbite := 10;
param nMemorie := 5;
param input :  1   2   3  4   5 :=
1              35   0  80 25  50
2             200  70 100 25   0
3               0 150   0 25 100
4             600 300   0 25  75
5             200   0 210 25 200
6              50   0  85  0  45
7              40  60  50  0 300 
8             300  90  20 60   0 
9               0 100 100 60  20
10              0  20 100 60 250
;
param durata := 
1  45
2  47
3  55 
4  45
5  35
6  42
7  30
8  35
9  44
10 40
;
param velocita := 9.00;
param capacita :=
1 1000
2 1200
3 1000
4  500
5  700
;
param contenutoIniziale :=
1 500
2 600
3 500
4 250
5 350
;
end;
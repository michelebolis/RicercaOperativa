# DATI
param nPeriodi; # Numero dei periodi
set Periodi := 1..nPeriodi; # Insieme dei periodi
param nProdotti; # Numero dei prodotti
set Prodotti := 1..nProdotti; # Insieme dei prodotti
param costiFissi{Periodi}; # Costi fissi [Euro] per l'utilizzo dei periodi produttivi
param costiProduzione{Prodotti, Periodi}; # Costi di produzione [Euro/unità di prodotto]
param costiStoccaggio{Prodotti, Periodi}; # Costi di stoccaggio [Euro/unità di prodotto]
param capacita{Prodotti, Periodi}; # Capacità produttiva [Unità di prodotto] in ogni periodo
param domanda{Prodotti, Periodi}; # Domanda del mercato [Unità di prodotto] per ogni periodo
# VARIABILI
var x{p in Prodotti, pe in Periodi} >= 0 <= capacita[p, pe]; # Quantita di prodotto in produzione nel periodo
var y{Prodotti, Periodi} >= 0; # Quantita di prodotto in stoccaggio nel periodo
var z{Periodi} binary; # Indica SE viene prodotto qualcosa nel periodo
# VINCOLI
subject to VincoloDomanda {pe in Periodi, p in Prodotti : pe < nPeriodi} :
  y[p, pe + 1] + domanda[p, pe] = x[p, pe] + y[p, pe];
# All'ultimo periodo non devo avere rimanenze
subject to No_rimanenze {p in Prodotti}:
  y[p, nPeriodi] + x[p, nPeriodi] = domanda[p, nPeriodi];
subject to StoccaggioIniziale {p in Prodotti} :
  y[p, 1] = 0;
# SE non viene prodotto niente
subject to VincoloProduzione {pe in Periodi, p in Prodotti} :
 x[p, pe] <= z[pe] * capacita[p, pe];
# FUNZIONE OBIETTIVO
minimize costiComplessivi : 
  sum{pe in Periodi} (costiFissi[pe] * z[pe]) + sum{p in Prodotti, pe in Periodi} (costiProduzione[p, pe] * x[p, pe] + costiStoccaggio[p, pe] * y[p, pe]);
#############
data;
param nPeriodi := 6;
param nProdotti := 3;

param costiFissi :=
   1     1300
   2     1500
   3     1700
   4     1500
   5     1000
   6      800
;
param costiProduzione : 1    2    3    4    5    6 :=
    1        12   10   15   17   17   15
    2        24   21   28   20   25   25
    3        18   15   20   18   18   20
;
param costiStoccaggio : 1    2    3    4    5    6 :=
    1         5    5    8    8    4    2
    2         8    9   12   15   16   10
    3         6    7    7    8    4    4
;
param capacita : 1    2    3    4    5    6 :=
    1        75   75   75   75   80   80
    2        50   50   55   55   60   65
    3        50   50   40   40   50   50
;
param domanda : 1    2    3    4    5    6 :=
    1        15   15   15   15   15   15
    2        25   25   35   35   25   25
    3        10    5    5    5   10   15
;
end;
# model testi-scolastici-pnl.mod; option solver knitro; solve;
# costiTotali = 11353.07416
reset;
# DATI
set Magazzini;
set Distributori;
param disponibilita{Magazzini};
param domanda{Distributori};
param capacita{Magazzini, Distributori};
param prezzoBase{Magazzini, Distributori};
# VARIABILI
var x{m in Magazzini, d in Distributori} >= 0 <= capacita[m, d] integer;
# VINCOLI
subject to disponibilitaMagazzino {m in Magazzini} :
  sum{d in Distributori} x[m, d] <= disponibilita[m];
subject to domandaSoddisfatta {d in Distributori} :
  sum{m in Magazzini} x[m, d] >= domanda[d];
# FUNZIONE OBIETTIVO
minimize costiTotali : sum{m in Magazzini, d in Distributori} x[m, d] * prezzoBase[m, d]/(1 - x[m, d] / capacita[m, d]);
#############
data;
set Magazzini := TO NA PA;
set Distributori := MI BO RM BA;
param disponibilita :=
TO 1200
NA 1400
PA 800
;
param domanda :=
MI 1000
BO 1200
RM 700
BA 500
;
param capacita : MI BO RM BA :=
TO 500 1000 1000 1000
NA 500 800 800 800
PA 800 600 600 600
;
param prezzoBase : MI BO RM BA :=
TO 3.9 1.4 1.1 1.4
NA 2.7 0.9 1.2 0.9
PA 2.4 1.4 1.7 1.3
;
end;
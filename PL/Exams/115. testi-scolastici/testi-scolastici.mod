# DATI
set Magazzini; # Insieme dei magazzini
set Distributori; # Insieme dei distributori a cui consegnare
param disponibilita{Magazzini}; # Disponibilita massima in ogni magazzino
param domanda{Distributori}; # Domanda da soddisfare di ogni distributore
param capacita{Magazzini, Distributori}; # Capacita massima per il trasporto dal magazzino al distributore
param costoUnitario{Magazzini, Distributori}; # Costo unitario di trasporto dal magazzino al distributore
# VARIABILI
var x{m in Magazzini, d in Distributori} >= 0 <= capacita[m, d];
# VINCOLI
subject to disponibilitaMagazzino {m in Magazzini} :
  sum{d in Distributori} x[m, d] <= disponibilita[m];
subject to domandaSoddisfatta {d in Distributori} :
  sum{m in Magazzini} x[m, d] >= domanda[d];
# FUNZIONE OBIETTIVO
minimize costiTotali : sum{m in Magazzini, d in Distributori} x[m, d] * costoUnitario[m, d];
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
param costoUnitario : MI BO RM BA :=
TO 7.5 2.6 1.7 1.6
NA 6.4 2.2 2.0 1.5
PA 5.8 2.4 1.8 1.4
;
end;
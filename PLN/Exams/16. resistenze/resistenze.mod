reset;
# DATI
# ampl: model classificatore.mod;
# ampl: option solver knitro;
# ampl: solve;
param nResistori; # Numero di tipi di resistori
param nPosizioni; # Numero delle posizioni da assegnare
set Resistori := 1..nResistori; # Insieme dei tipi di resistori
set Posizioni := 1..nPosizioni; # Insieme delle posizioni
param resistenza{Resistori}; # Vettore dei valori delle resistenze per ogni tipo di resistore
param numero{Resistori}; # Numero disponibile di ogni tipo di resistore
param target; # Resistenza totale desiderata
# VARIABILI
var delta >= 0; # Differenza tra la resistenza totale desiderata e quella ottenuta
var x{Resistori, Posizioni} binary; # Indica SE il tipo di resistore è impiegato nella posizione
# Quando tutto le variabili binarie sono state fissate, del sottoproblema non resta niente, c è solo una soluzione
var Resistenza{p in Posizioni} = sum{r in Resistori} x[r, p] * resistenza[r];
var ResistenzaTot = Resistenza[1]*Resistenza[2]/(Resistenza[1]+Resistenza[2])
                   +Resistenza[3]*Resistenza[4]/(Resistenza[3]+Resistenza[4]);
# VINCOLI
subject to VincoloPosizione{p in Posizioni} : # Un solo resistore in una posizione
  sum{r in Resistori} x[r, p] = 1;
subject to VincoloDisponibilita{r in Resistori} : # Non posso usare piu resistori di quelli disponibili
  sum{p in Posizioni} x[r, p] <= numero[r];
# Linearizzazione del valore assoluto
subject to Linearezzazione1 : delta >= target-ResistenzaTot;
subject to Linearezzazione2 : delta >= ResistenzaTot-target;
# FUNZIONE OBIETTIVO
minimize z : delta;
#############
data;
param nResistori := 6;
param nPosizioni := 4;
param : numero resistenza :=
 1      1         12
 2      1         15
 3      2         20
 4      2         22
 5      1         30
 6      1         40
;
param target := 65;
end;

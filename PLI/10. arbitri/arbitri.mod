# DATI
param nArbitri; # Numero degli arbitri
set arbitri := 1..nArbitri; # Insieme degli arbitri
param nSquadre; # Numero delle squadre
set squadre := 1..nSquadre; # Insieme delle squadre
param nGiornate; # Numero delle giornate
set giornate := 1..nGiornate; # Insieme delle giornate
param nPartite := nSquadre/2; # Numero delle partite
set partite := 1..nPartite; # Insieme delle partite
param calendario{giornate, partite, squadre} binary default 0; # Calendario, che indica quale squadra gioca quella partita
# VARIABILI
var presenza{arbitri, giornate, partite} binary; # 1 SE l'arbitri arbitra la partita
var nPresenza{arbitri, squadre}; # Indica quante volte un arbitro era presente nella partita della squadra
var maxPresenza;
var minPresenza;
# VINCOLI
subject to vincoloPresenza {g in giornate, p in partite} :
  sum{a in arbitri} presenza[a, g, p] = 1;
subject to vincoloPresenzaUnica {g in giornate, a in arbitri} :
  sum{p in partite} presenza[a, g, p] <= 1;
subject to vincoloNPresenza {a in arbitri, s in squadre} :
  sum{g in giornate, p in partite} presenza[a, g, p] * calendario[g, p, s] = nPresenza[a, s];
subject to vincoloMax {a in arbitri, s in squadre} :
  nPresenza[a, s] <= maxPresenza;
subject to vincoloMin {a in arbitri, s in squadre} :
  nPresenza[a, s] >= minPresenza;
# FUNZIONE OBIETTIVO
minimize delta : maxPresenza - minPresenza;
#############
data;
param nArbitri := 3;
param nSquadre := 6;
param nGiornate := 5;
param calendario :=
[1,1,1] 1
[1,1,6] 1
[1,2,2] 1
[1,2,5] 1
[1,3,3] 1
[1,3,4] 1

[2,1,1] 1
[2,1,4] 1
[2,2,2] 1
[2,2,6] 1
[2,3,3] 1
[2,3,5] 1

[3,1,1] 1
[3,1,2] 1
[3,2,3] 1
[3,2,6] 1
[3,3,4] 1
[3,3,5] 1

[4,1,1] 1
[4,1,5] 1
[4,2,2] 1
[4,2,3] 1
[4,3,4] 1
[4,3,6] 1

[5,1,1] 1
[5,1,3] 1
[5,2,2] 1
[5,2,4] 1
[5,3,5] 1
[5,3,6] 1
;
end;
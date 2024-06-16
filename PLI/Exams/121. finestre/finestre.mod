# Finestre
# DATI
param nClienti; # Numero dei clienti da visitare
set Clienti := 1..nClienti; # Insieme dei clienti
param tempo {Clienti}; # tempo di viaggio
param nIntervalli;  # Numero totale di intervalli
set Intervalli := 1..nIntervalli;  # Insieme degli indici degli intervalli
param inizio {Clienti, Intervalli}; # Inizio dell'intervallo
param fine {Clienti, Intervalli}; # Fine dell'intervallo
# VARIABILI
var x {Clienti}; # orario di partenza da un dato clientes
var y {Clienti, Intervalli} binary; # Variabile binaria per selezionare l'intervallo di tempo
# VINCOLI
subject to Finestre {c in Clienti} : sum {i in Intervalli} y[c, i] = 1;
subject to Partenza {c in Clienti, i in Intervalli}:
    x[c] >= inizio[c, i] - (1 - y[c,i]) * 10000;
subject to Fine {c in Clienti, i in Intervalli}:
    x[c] <= fine[c, i] + (1 - y[c,i]) * 10000;
subject to vincoloIntervalli {c in Clienti : c < nClienti}:
    x[c + 1] >= x[c] + tempo[c];
# OBIETTIVO
minimize z: x[nClienti] + tempo[nClienti] - x[1];
#####################
data;
param nClienti := 5;
param tempo :=
1 48
2 80
3 72
4 88
5 52
;
param nIntervalli := 4;
param inizio : 1 2 3 4 :=
1 0 460 0 0
2 68 148 200 0
3 200 264 320 0
4 215 264 332 412
5 312 400 464 0
;
param fine : 1 2 3 4 :=
1 200 560 0 0
2 112 176 220 0
3 244 276 344 0
4 235 296 368 420
5 344 416 504 0
;
end;

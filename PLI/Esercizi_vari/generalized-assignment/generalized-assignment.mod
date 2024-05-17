# Il risultato del risolutore è ottimo MA non necessariamente unico
# DATI
param nJobs; # Numero dei jobs
set Jobs := 1..nJobs; # Insieme dei jobs
param nMacchine; # Numero delle macchine
set Macchine := 1..nMacchine; # Insieme delle macchine
param funzionamentoMax{Macchine}; # Tempo massimo di funzionamento di una macchina [min]
param esecuzione{Jobs, Macchine}; # Tempo di esecuzione di ogni job su ogni macchina [min]
param costoEsecuzione{Jobs, Macchine}; # Costo di esecuzione di ogni job su ogni macchina [Euro]
# VARIABILI
var x{Jobs, Macchine} binary; # Indica l'assegnamento di un job a una macchina
# VINCOLI
subject to VincoloTempo {m in Macchine} :
  sum{j in Jobs} esecuzione[j, m] * x[j, m] <= funzionamentoMax[m];
subject to VincoloJob {j in Jobs} :
  sum{m in Macchine} x[j, m] = 1;
# FUNZIONE OBIETTIVO
minimize costoTotale : sum{j in Jobs, m in Macchine} costoEsecuzione[j, m] * x[j, m]; 
#############
data;
param nJobs := 9;
param nMacchine := 3;
param funzionamentoMax :=
1 380
2 360
3 350
;
param esecuzione : 1   2   3 :=
1                 100 102  97
2                 111 110 113
3                  98 103  96
4                 132 130 135
5                 120 123 117
6                 115 112 118
7                 142 145 140
8                 123 120 125
9                  90 93 88
;
param costoEsecuzione :  1  2  3 := 
1                       24 42 23
2                       30 45 23
3                       33 54 16
4                       37 45 18
5                       34 47 22
6                       31 42 25
7                       30 41 19
8                       28 47 15
9                       25 50 20
;
end;
# DATI
param nJobs;
set Jobs := 1..nJobs;
param durata{Jobs};
param inizio{Jobs};
param fine{Jobs};
# VARIABILI
var x{j1 in Jobs, j2 in Jobs : j1 <> j2} binary;
var tempoInizio{j in Jobs} >= inizio[j] <= fine[j] - durata[j];
var makespan;
# VINCOLI
subject to UnicaPrecedenza{j1 in Jobs, j2 in Jobs : j1 <> j2} : 
  x[j1, j2] + x[j2, j1] = 1;
param M := 1000;
subject to Disgiuntivi {i in Jobs, j in Jobs: i<>j}:
  tempoInizio[j] >= (tempoInizio[i] + durata[i]) - M * x[j,i];
# FUNZIONE OBIETTIVO
# obiettivo 3: massimizzare l’anticipo con cui mediamente i jobs vengono completati rispetto alla loro scadenza, cioè all’istante finale della loro finestra temporale
maximize z3: (1/nJobs) * sum {j in Jobs} (fine[j] - (tempoInizio[j] + durata[j]));
#############
data;
param nJobs := 7;
param durata :=
1 10  
2 14  
3 21  
4 18  
5 4  
6 23  
7 35
;
param: inizio fine :=
1     15      50
2      0      80
3      0      95
4     10      75
5      5      30
6     13     130
7     18     120
;
end;
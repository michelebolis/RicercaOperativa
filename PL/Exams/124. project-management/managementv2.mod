# DATI
set Attivita;
param X{Attivita};
param Y{Attivita};
set prec within {Attivita, Attivita};
# VARIABILI
var inizio{Attivita} >= 0;
var fine{Attivita} >= 0;
var makespan;
var d{Attivita};
var mu >= 0 <= 1;
# VINCOLI
subject to durata{a in Attivita} : 
  d[a] = (X[a] * mu + Y[a] * (1 - mu));
subject to vincoloTemporale{a in Attivita} :
  fine[a] - inizio[a] >= d[a];
subject to minimo{a in Attivita} :
  makespan >= fine[a];
subject to vincoloPrecedenze{(a1, a2) in prec} :
  inizio[a2] >= fine[a1];
# FUNZIONE OBIETTIVO
minimize tot : makespan;
#############
data;
set Attivita := A B C D E F G H;
param : X Y :=
A 30 20
B 15 45
C 25  5
D 32 12
E 14 12
F 19 49
G 20 10
H 10 18
;
set prec := 
D, A
E, A
E, B
F, B
F, C
G, D
G, E
H, D
H, E
;
end;
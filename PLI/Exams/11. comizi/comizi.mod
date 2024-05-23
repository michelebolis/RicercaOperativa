# DATI
param velocita; # Velocita media [km/h]
param tempoSosta; # Tempo fisso per ogni sosta [ore]
param tempoDisponibile; # Tempo disponibile per i comizi [ore]
set Citta; # Insieme delle città
param distanza{Citta}; # Vettore delle distanze di ogni citta da quella iniziale
set Comizi := 1..2; # Insieme dei tipi di comizi
param audience{Citta, Comizi}; # Indica per ogni città e tipo di comizio, l'audience attesa
param durata{Comizi}; # Vettore delle durate dei tipi di comizi
# VARIABILI
var x{Citta, Comizi} binary >= 0; # Indica SE nella citta fissata venga fatto un comizio del tipo fissato
var spostamento >= 0; # Tempo totale impiegato per gli spostamenti
# VINCOLI
subject to VincoloComizio : # Ci deve essere almeno un comizio
  sum{c in Citta, co in Comizi} x[c, co] <= 1;
subject to VincoloSpostamento : # Non si puo eccedere il tempo disponibile
  sum{c in Citta, co in Comizi} x[c, co] * (durata[co] + tempoSosta) <= tempoDisponibile - spostamento;
subject to VincoloDurataViaggi {c in Citta} : 
  velocita * spostamento >= distanza[c] * sum{co in Comizi} x[c, co];
# FUNZIONE OBIETTIVO
maximize spettatoriTotali : sum{c in Citta, co in Comizi} x[c, co] * audience[c, co];
#############
data;
param velocita := 100;
param tempoSosta := 0.5;
param durata :=
1 1
2 1.5
;
param tempoDisponibile := 16;
set Citta := A B C D E F G H I J K L M N O P Q R S T U V W X Y;

param distanza :=
A         0
B        12
C        25
D        31
E        46
F        60
G        72
H        89
I       110
J       127
K       142
L       160
M       166
N       170
O       180
P       193
Q       211
R       218
S       230
T       244
U       263
V       280
W       285
X       292
Y       298;

param audience :  1       2 :=
A       120     140   
B        80     200  
C        60     100 
D       400     450
E       200     250
F        10      30   
G       500     550   
H        90     110   
I        50      80   
J       300     330   
K        10      50   
L        60      90   
M       230     280   
N       190     240   
O       100     150   
P       100     110   
Q       100     180   
R       200     300   
S        80     180   
T        10      20   
U        80     150   
V        90     100   
W       120     130  
X       500     650  
Y       400     490;

end;
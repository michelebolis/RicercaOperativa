# DATI
param nMangimi; # Numero dei mangimi
set Mangimi := 1..nMangimi; # Insieme dei mangimi
param nLinee; # Numero delle linee
set Linee := 1..nLinee; # Insieme delle linee
set Ingredienti; # Insieme degli ingredienti
param composizione{Mangimi, Ingredienti}; # Composizione dei mangimi (percentuale di ogni ingrediente per ogni tipo di mangime)
param tempoProduzione{Mangimi, Linee}; # Tempi di produzione dei mangimi (minuti / quintale) per ogni linea di miscelazione
param disponibilita{Ingredienti}; # Ingredienti disponibili (quintali / giorno)
param prezzo{Mangimi}; # Prezzi di vendita per ogni tipo di mangime (Klire / quintale)
# La lavorazione inizia alle ore 6:00 del mattino ogni giorno.
param tempoDisponibile{Mangimi}; # Tempo disponibile per la produzione
param tempoInizio{Mangimi}; # Tempi minimi di inizio lavorazione per ogni tipo di mangime.
param tempoFine{Mangimi}; # Tempi massimi di fine lavorazione per ogni tipo di mangime.
param produzioneAttuale{Linee, Mangimi}; 
param nuoviPrezzi{Mangimi}; # Vettore dei nuovi prezzi di vendita dei mangimi
# VARIABILI
var inizio {m in Mangimi, Linee} >= tempoInizio[m]; #�inizio per ogni mangime e linea [min]
var fine {m in Mangimi, Linee} <= tempoFine[m]; #�fine per ogni mangime e linea [min]
var x{Linee, Mangimi} >= 0; 
# VINCOLI
subject to Consumi {i in Ingredienti}:
  sum {m in Mangimi, l in Linee} composizione[m, i]/100 * x[l, m] <= disponibilita[i];
subject to Produzione {m in Mangimi, l in Linee}:
  x[l, m] = (fine[m, l] - inizio[m, l]) / tempoProduzione[m, l];
subject to NonSovrapposizioneLinea {l in Linee, m in Mangimi: m > 1}:
  inizio[m, l] >= fine[m - 1, l];
# FUNZIONE OBIETTIVO
maximize profitto : sum{l in Linee, m in Mangimi} x[l, m] * nuoviPrezzi[m];
#############
data;
param nMangimi := 5;
set Ingredienti := A B C D;
param nLinee := 3;
param composizione : A    B    C    D :=
1                   30   20   20   30
2                   40    5   10   45
3                   40   35   10   15
4                   50   20   20   10
5                   50   30    5   15
;
param tempoProduzione : 1  2  3 :=
1                       5  4  2
2                       8  5  2
3                      10 10  2
4                      10  5  5
5                       3  5  5 
;
param disponibilita :=
A 150
B 135
C  90
D  75
;
param prezzo :=
1 40
2 50
3 35
4 55 
5 30
;
param: tempoInizio tempoFine :=
1            0        120
2           30        180
3          120        270
4          225        300
5          285        360
;
param produzioneAttuale : 1     2  3   4  5 :=
1                        27     0 12   0 50
2                        33.75 13  2.5 6 30
3                        60     0 90   0 21
;
param nuoviPrezzi :=  
1 10
2 10
3 55
4 65
5 40
;
end;
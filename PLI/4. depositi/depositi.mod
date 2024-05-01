# DATI
param nUtenti; # Numero degli utenti
set utenti := 1..nUtenti; # Insieme degli utenti
param nDepositi; # Numero dei depositi
set depositi := 1..nDepositi; # Insieme dei depositi
param trasporto{depositi, utenti}; # Costi di trasporto da un deposito a un utente
param servizio{depositi}; # Costi di servizio del deposito
param capacita{depositi}; # Capacita totale del deposito
param domanda{utenti}; # Domanda degli utenti
# VARIABILI
var x{depositi, utenti} binary; # Variabile binaria che indica se effettua spedizione dal deposito all utente
var q{depositi, utenti} >= 0; # Variabile che indica la quantita spedita dal magazzino al deposito
# VINCOLI
subject to vincoloCapacita {d in depositi}:
  sum{u in utenti} q[d, u] <= capacita[d];
subject to vincoloDomanda {u in utenti}:
  sum{d in depositi} q[d, u]= domanda[u];
subject to vincoloSpedizione {u in utenti} :
  sum{d in depositi} x[d, u] = 1;
# FUNZIONE OBIETTIVO
minimize costiTotali : 
  sum{d in depositi, u in utenti} (trasporto[d, u] + q[d,u] * servizio[d]);
#############
data;
param nUtenti := 10;
param nDepositi := 5;
param trasporto : 1  2  3  4  5  6  7  8  9 10 :=
1                35 24 62 57 81 34 36 12 63 24
2                72 25 42 25 64 14 24 74 84 15
3                48 37 62 14 56 94 51 76 11 21
4                26 26 73 83 15 89 89 21 44 53
5                62 26 37 26 15 37 24 61 54 13
;
param servizio :=
1 35
2 32
3 38
4 38
5 41
;
param capacita :=
1 175
2 126
3 110
4  92
5 155
;
param domanda :=
1  35
2  28
3  49
4  37
5  40
6  26
7  31
8  48
9  28
10 36
;
end;
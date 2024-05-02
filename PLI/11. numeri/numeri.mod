# DATI
set cifre := 1..9;
param soglia; # Soglia massima della somma
set pesi := 0..2;
param numeri{cifre};
# VARIABILI
var x{cifre, pesi} binary;
var somma <= soglia;
# VINCOLI
subject to pesoUnico {c in cifre} :
  sum{p in pesi} x[c, p] = 1;
subject to implicazioneLogica {c in cifre, p in pesi : c<9 and p>0} :
  x[c, p] <=  x[c+1, p-1];
subject to UltimaPosizione: 
  x[9,0] = 1;
subject to calcoloSomma :
  somma = sum{c in cifre, p in pesi} numeri[c]*x[c, p]*10^p;
# FUNZIONE OBIETTIVO
maximize risultato : somma;
#############
data;
param soglia := 1000;
param numeri :=
1 9
2 8
3 7
4 6
5 5
6 4
7 3
8 2
9 1;
end;
# DATI
param nTermoelettrici; # Numero degli impianti Termoelettrici
set Termoelettrici := 1..nTermoelettrici; # Insieme degli impianti Termoelettrici
param nIdroelettrici; # Numero degli impianti Idroelettrici
set Idroelettrici := 1..nIdroelettrici; # Insieme degli impianti Idroelettrici
param nGiorni; # Numero dei giorni
set Giorni := 1..nGiorni; # Insieme dei giorni
param coeff; # Coefficiente per la produzione di energia dall'acqua
param prodMin{Termoelettrici}; # Produzione minima dell'impianto Termoelettrici SE è acceso
param prodMax{Termoelettrici}; # Produzione massima dell'impianto Termoelettrici SE è acceso
param costoFisso{Termoelettrici}; # Costo fisso dell'impianto Termoelettrici SE è acceso
param costoUnit{Termoelettrici}; # Costo unitario per energia prodotta dall'impianto
param capacita{Idroelettrici}; # Capacita massima dell'impianto Idroelettrico
param volumeIniziale{Idroelettrici}; # Volume iniziale dell'impianto Idroelettrici
param alimentazione{Idroelettrici}; # Quantita di acqua in input ogni giorno
param domanda{Giorni}; # Domanda di energia da soddisfare
param epsilon := 0;
# VARIABILI
param acceso{Termoelettrici, Giorni} binary;
var energia{t in Termoelettrici, g in Giorni}  <= prodMax[t];
var acqua{i in Idroelettrici, g in Giorni} >= 0 <= capacita[i];
var acquaTrasformata{i in Idroelettrici, g in Giorni} >= 0;
# VINCOLI
subject to Domanda{g in Giorni : g<>4} :
  sum{t in Termoelettrici} (energia[t, g]) + sum{i in Idroelettrici} (acquaTrasformata[i, g] * coeff) = domanda[g];
subject to Domanda4 :
  sum{t in Termoelettrici} (energia[t, 4]) + sum{i in Idroelettrici} (acquaTrasformata[i, 4] * coeff) = domanda[4] + epsilon;
subject to giorno1{i in Idroelettrici} : 
  acqua[i, 1] = volumeIniziale[i] - acquaTrasformata[i, 1] + alimentazione[i];
subject to vincoloAcqua{i in Idroelettrici, g in Giorni : g > 1} :
  acqua[i, g] = acqua[i, g - 1] - acquaTrasformata[i, g] + alimentazione[i];
subject to prodMinima{t in Termoelettrici, g in Giorni} :
  energia[t, g] >= prodMin[t] * acceso[t, g];
subject to prodMassima{t in Termoelettrici, g in Giorni} :
  energia[t, g] <= prodMax[t] * acceso[t, g];
# FUNZIONE OBIETTIVO
minimize costoTotale : sum{g in Giorni} (sum{t in Termoelettrici} (energia[t, g] * costoUnit[t] + acceso[t, g] * costoFisso[t]));
#############
data;
param nTermoelettrici := 3;
param nIdroelettrici := 3;
param nGiorni := 7;
param coeff := 0.05;
param : prodMin prodMax costoFisso costoUnit :=
1 10 90 60 2
2 20 100 50 3
3 20 20 40 5
;
param : capacita volumeIniziale alimentazione :=
1 600 500 200
2 2000 1500 400
3 300 100 100
;
param domanda :=
1 200
2 180
3 150
4 200
5 250
6 250
7 180
;
param acceso : 1 2 3 4 5 6 7 :=
1              1 1 1 1 1 1 1
2              1 1 0 1 1 1 0
3              0 0 0 0 0 0 0
;
end;
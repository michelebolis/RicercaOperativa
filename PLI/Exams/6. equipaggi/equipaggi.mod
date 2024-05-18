# DATI
param nVoli;
set Voli := 1..nVoli; # Numero dei voli
set Sequenze; # Insieme delle sequenze
set VoliSequenza{Sequenze} within Voli; # Insieme dei voli assegnati ad ogni sequenza
param costi{Sequenze}; # Costo associato ad una sequenza
param nEquipaggi := 7; # Numero degli equipaggi
# VARIABILI
var x{Sequenze} binary; # Indica SE la sequenza di voli è coperta da un equipaggio
# VINCOLI
subject to VoloCoperto{v in Voli} :
  sum{s in Sequenze : v in VoliSequenza[s]} x[s] >= 1;
subject to NEquipaggi :
  sum{s in Sequenze} x[s] = nEquipaggi;
# FUNZIONE OBIETTIVO
minimize costiIdle : sum{s in Sequenze} x[s] * costi[s];
#############
data;
param nVoli := 30;

param : Sequenze : costi :=
  A01     1200  
  A02     1250  
  A03     2650  
  A04     1400  
  A05     1200  
  A06     1600  
  A07     2250  
  A08     1400  
  A09     1600  
  A10     2300  
  B11     2450  
  B12     2250  
  B13     1900  
  B14     1800  
  B15     1300  
  B16     1600  
  B17     1550  
  B18     1800  
  B19     2900  
  B20     1250  
  C21     1450  
  C22     2250  
  C23     2800  
  C24     1500  
  C25     1200  
  C26     1100  
  C27     1100  
  C28     2050  
  C29     2750  
  C30     1850  
  D31     1900  
  D32     1000  
  D33     1450  
  D34     2650  
  D35     2050  
  D36     2900  
  D37     1950  
  D38     1250  
  D39     1400  
  D40     1400  
  E41     1100  
  E42     1100  
  E43     2750  
  E44     2550  
  E45     2350  
  E46     2550  
  E47     2700  
  E48     1850  
  E49     1300  
  E50     1950
;

set VoliSequenza[A01] :=         1  2  3  4  5;
set VoliSequenza[A02] :=         1  2  3  6  7;
set VoliSequenza[A03] :=         1  2  4  7  8;
set VoliSequenza[A04] :=         1  2  4  9 10;
set VoliSequenza[A05] :=         3  4 11 12 15;
set VoliSequenza[A06] :=         3  8 16 18 20;
set VoliSequenza[A07] :=        10 12 13 14 15;
set VoliSequenza[A08] :=        10 14 16 17 19;
set VoliSequenza[A09] :=        14 15 18 19 20;
set VoliSequenza[A10] :=        15 16 17 19 20;
set VoliSequenza[B11] :=         2  5  7 11 13 16;
set VoliSequenza[B12] :=         3  9 10 12 16 18;
set VoliSequenza[B13] :=         5  6 12 15 18 19;
set VoliSequenza[B14] :=         7  8  9 11 13 16;
set VoliSequenza[B15] :=         8  9 12 14 16 19;
set VoliSequenza[B16] :=         9 15 16 18 19 20;
set VoliSequenza[B17] :=        10 12 14 17 19 20;
set VoliSequenza[B18] :=        10 11 13 15 18 19;
set VoliSequenza[B19] :=        11 13 14 16 17 18;
set VoliSequenza[B20] :=        14 15 16 17 18 19;
set VoliSequenza[C21] :=         1  3  5  7  9 14 21;
set VoliSequenza[C22] :=         2  3  5  6  8 15 22;
set VoliSequenza[C23] :=         3  5  6  9 13 16 23;
set VoliSequenza[C24] :=         4  8  9 11 12 17 24;
set VoliSequenza[C25] :=         5  9 13 14 16 20 25;
set VoliSequenza[C26] :=         6  8 14 15 19 20 26;
set VoliSequenza[C27] :=         7  9 10 11 12 28 27;
set VoliSequenza[C28] :=         8 10 11 13 16 17 28;
set VoliSequenza[C29] :=         9 12 14 15 18 19 29;
set VoliSequenza[C30] :=        10 11 13 16 18 20 30;
set VoliSequenza[D31] :=         2  6 14 16 21 24 29 30;
set VoliSequenza[D32] :=         1  4 13 17 23 25 28 30;
set VoliSequenza[D33] :=         5 10 11 15 21 25 27 28;
set VoliSequenza[D34] :=         5 10 14 17 21 25 29 30;
set VoliSequenza[D35] :=         8 12 13 19 22 26 28 29;
set VoliSequenza[D36] :=         8 13 17 20 23 24 26 27;
set VoliSequenza[D37] :=         9 10 18 19 25 26 29 30;
set VoliSequenza[D38] :=         9 10 13 15 21 23 28 29;
set VoliSequenza[D39] :=         9 10 11 13 21 22 24 28;
set VoliSequenza[D40] :=         9 10 15 18 23 25 27 29;
set VoliSequenza[E41] :=         2  4  8 12 15 19 21 24 27;
set VoliSequenza[E42] :=         3  4  7 11 13 15 21 22 24;
set VoliSequenza[E43] :=         4  5  6 13 14 16 21 23 26;
set VoliSequenza[E44] :=         4  7  8 13 15 18 21 24 27;
set VoliSequenza[E45] :=         5  7  8 13 15 17 22 23 28;
set VoliSequenza[E46] :=         5  8  9 13 16 19 22 24 27;
set VoliSequenza[E47] :=         6  7  9 14 15 18 22 25 30;
set VoliSequenza[E48] :=         6  8  9 14 17 20 23 24 30;
set VoliSequenza[E49] :=         7  8 10 16 17 19 23 25 29;
set VoliSequenza[E50] :=         8  9 10 17 18 20 24 26 30;
end;
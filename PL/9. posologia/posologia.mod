# DATI
set farmaci; # Farmaci tra cui scegliere il dosaggio
param costi{farmaci}; # Costo al grammo in  euro del farmaco
param livelloMax; # Livello massimo della proteina Y
param nFasceOrarie; # Numero di fasce orarie in cui suddividere la giornata
set fasceOrarie := 1..nFasceOrarie; # Insieme delle fasce orarie
param livelloMin{fasceOrarie}; # Livello minimo di proteina Y in ogni fascia oraria
set oreAntecedenti := 0..11; # insieme delle ore antecedenti all assunzione del farmaco
param eff{oreAntecedenti, farmaci}; #  Efficienza del farmaco dopo ore di assunzione
# VARIABILI
var x{fasceOrarie, farmaci} >=0; # Quantita di farmaci da assumere in ogni fascia oraria
var y{o in fasceOrarie} >= livelloMin[o] <= livelloMax; # Quantita di Y in ogni fascia oraria
# VINCOLI
# Nota: l'if sommando 24 viene fatto per garantire la circolarita
subject to effetto {o in fasceOrarie} :
  y[o] = sum {a in oreAntecedenti, t in fasceOrarie, f in farmaci : 
    (t = o - a) or (t = o - a + 24)} eff[a, f] * x[t, f];
# FUNZIONE OBIETTIVO
# Minimizzare a) la quantità di farmaci da assumere giornalmente
#minimize quantitaFarmaci :  sum{o in fasceOrarie, f in farmaci} x[o, f];
# oppure b) i costi totali per i farmaci
minimize costiTotali : sum{o in fasceOrarie, f in farmaci} costi[f] * x[o, f];
######
data;
set farmaci := Prismil Cilindren;
param costi :=
Prismil   0.70
Cilindren 0.95
;
param livelloMax := 45;
param nFasceOrarie  := 24;
param livelloMin :=
1   5
2   1
3   0
4   0
5   0
6   0
7   4
8  15
9  12
10  5
11  4
12  3
13 25
14 30
15 25
16 15
17  5
18  4
19  3
20 25
21 30
22 25
23 20
24 10
;
param eff: Prismil Cilindren :=
 0          1.5      2.5
 1          3.0      4.0
 2          4.0      5.5
 3          2.5      4.0
 4          1.9      3.0
 5          1.4      1.5
 6          1.0      0.7
 7          0.7      0.4
 8          0.5      0.2
 9          0.3      0.0
10          0.2      0.0
11          0.1      0.0
;
end;
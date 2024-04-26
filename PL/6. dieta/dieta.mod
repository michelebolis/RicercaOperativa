# DATI  
set alimenti; # Insieme degli alimenti
set sostanze; # Insieme delle sostanze
param sostanzeNutritive{sostanze, alimenti}; # Quantita [g per ogni kg] di sostanze nutritive per ogni alimento
param costi{alimenti}; # Costo in € per ogni kg di alimento
param upperBounds{sostanze}; # Quantita massima di sostanze nella dieta
param lowerBounds{sostanze}; # Quantita minima di sostanze nella dieta
# VARIABILI
var x{alimenti} >= 0; # Quantità acquistata di ogni alimento
# VINCOLI
subject to Limite_superiore {s in sostanze} : 
  sum{a in alimenti} x[a]*sostanzeNutritive[s, a] <= upperBounds[s];
subject to Limite_inferiore {s in sostanze} : 
  sum{a in alimenti} x[a]*sostanzeNutritive[s, a] >= lowerBounds[s];
# FUNZIONE OBIETTIVO
minimize costi_totali : sum{a in alimenti} x[a]*costi[a];
#########
data;
set alimenti := Pasta Latte Formaggio Pesce Verdura Pane Polenta;
set sostanze := Proteine Carboidrati Grassi;
param sostanzeNutritive : Pasta Latte Formaggio Pesce Verdura Pane Polenta :=
Proteine                   11.5 3.15     8       18.5    2.1   12     9 
Carboidrati                72.7 4.85     3.8      0.5    0     68    74
Grassi                      1.5 1.55    11       19      0.1    6     1
;
param costi :=
Pasta      4
Latte      4
Formaggio 15 
Pesce     22.5
Verdura    3
Pane       1
Polenta    5
;
param upperBounds := 
Proteine    35
Carboidrati 25
Grassi      20
;
param lowerBounds :=
Proteine    25
Carboidrati 15
Grassi      10
;
end;
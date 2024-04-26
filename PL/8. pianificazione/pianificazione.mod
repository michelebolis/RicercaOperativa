# DATI
param nMesi;
set Mesi := 1..nMesi; # Insieme dei mesi
param obiettivo{Mesi}; # Obiettivo in tonnellate di gelato per ogni mese
param capacitaProduttiva{Mesi};
param costiIngredienti{Mesi};
param costiImmagazzinamento{Mesi};
param y0 := 0;
# VARIABILI
var x{m in Mesi} >= 0 <= capacitaProduttiva[m]; # Quantita di gelato da produrre
var y{m in Mesi} >= 0; # Quantita di gelato non venduto
# VINCOLI 
subject to vincolo_immagazinamento {m in Mesi: m>1}:
  y[m - 1] + x[m] = obiettivo[m] + y[m]; 
subject to primo_mese: # Risolvo il problema dell'out of domain con y[0 - 1] nel vincolo soprastante
  y0 + x[1] = obiettivo[1] + y[1];
# OBIETTIVO
minimize z : sum{m in Mesi} (costiIngredienti[m] * x[m] + costiImmagazzinamento[m] * y[m]);
#####
data;
param nMesi := 4;
param obiettivo := 
1 200
2 300
3 500
4 400
;
param capacitaProduttiva :=
1 400
2 500
3 300
4 500;
param costiIngredienti :=
1 34
2 36
3 32
4 38
;
param costiImmagazzinamento :=
1 2000
2 3000
3 2000
4 3000
;
end;
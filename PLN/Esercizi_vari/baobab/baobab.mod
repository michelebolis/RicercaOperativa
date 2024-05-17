# DATI
param costi_fissi := 1000.00; # Costi fissi [Euro]
param costi_variabili := 10.00; # Costi variabili [Euro/kg]
param k := 80; # Coefficiente di proporzionalità
param max_quantita := 70; # Quantità massima che il mercato può assorbire [kg/mese]
param max_prezzo := 20; # Prezzo massimo di vendita [Euro/Kg]

# Variabile 
var A >= 0, <= max_quantita := 65; # Quantita da acquistare

# Obiettivo
# Massimizzare i profitti = ricavi - costi [euro/mese]
maximize z : max_prezzo * A - (costi_variabili * A + k * sqrt(A));

end;
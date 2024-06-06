# model scorte.mod; option solver knitro; solve;
# costiTotali = 854.844
reset;
# DATI
set Merci;
param periodoOttimo{Merci};
param costiOttimi{Merci};
# VARIABILI
var h{Merci} integer >= 1 ;
var periodo{m in Merci} = h[m] * 7;
var costi{m in Merci} = costiOttimi[m] * 1/2 * (periodo[m]/periodoOttimo[m] + periodoOttimo[m]/periodo[m]);
# VINCOLI
# FUNZIONE OBIETTIVO
minimize costiTotali : sum{m in Merci} costi[m];
#############
data;
set Merci := A B C D E F G;
param periodoOttimo :=
  A            17 
  B            10 
  C            19 
  D            12 
  E             5 
  F            12.5 
  G            24 
;
param costiOttimi := 
  A            140 
  B             65 
  C            200 
  D            115 
  E             75 
  F            145 
  G            100
;
end;
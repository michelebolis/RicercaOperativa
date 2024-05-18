# DATI
set Amiche;
param nGruppi;
set Gruppi := 1..nGruppi;
param gradimento{Amiche};
set GruppiAmiche{Gruppi} within Amiche;
# VARIABILI
var x{Amiche} binary;
# VINCOLI
subject to Relazioni{g in Gruppi} :
  sum{a in Amiche : a in GruppiAmiche[g]} x[a] <= 1;
# FUNZIONE OBIETTIVO
maximize gradimentoTotale : sum{a in Amiche} gradimento[a] * x[a];
#############
data;
param nGruppi := 7;
param : Amiche : gradimento :=
Samantha 100
Jessica 100
Melissa 90
Pamela 85
Naomi 50
Anastasia 20 
Genoveffa 15
Grimilde 10
;
set GruppiAmiche[1] := Samantha Jessica Melissa;
set GruppiAmiche[2] := Jessica Melissa Pamela;
set GruppiAmiche[3] := Jessica Grimilde;
set GruppiAmiche[4] := Melissa Genoveffa;
set GruppiAmiche[5] := Pamela Naomi;
set GruppiAmiche[6] := Grimilde Genoveffa Naomi;
set GruppiAmiche[7] := Grimilde Genoveffa Anastasia;
end;
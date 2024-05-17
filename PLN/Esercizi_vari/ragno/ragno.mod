# DATI
set N := 0..2; # Insieme degli artigli/vertici del triangolo
# Indici da 0 a 2 e non da 1 a 3 perche uso il modulo
# Coordinate artigli
param x{N}; 
param y{N}; 
param z{N};
param A := 100; # Area minima richiesta

# VARIABILI
# Coordinate vertici triangolo
var xx{N};
var yy{N};
var zz{N};

var lato{i in N} = sqrt((xx[(i+1) mod 3] - xx[(i+2) mod 3])^2 + 
				        (yy[(i+1) mod 3] - yy[(i+2) mod 3])^2 +
				        (zz[(i+1) mod 3] - zz[(i+2) mod 3])^2
				       );; # Lunghezze dei lati
var p = sum{i in N} lato[i] / 2; # Semiperimetro

# VINCOLI
subject to Areaminima : 
	p * (p - lato[0]) * (p-lato[1]) * (p-lato[2]) >= A^2; 

# OBIETTIVO
minimize obiettivo : sum{i in N} lato[i] + 
					 sum{i in N} sqrt((xx[i] - x[i])^2 + (yy[i] - y[i])^2 + (zz[i] - z[i])^2);

##########
data;
param :  x  y  z :=
0		30 50 50
1		60 10 45
2		40 30 10
;
# Svantaggi: distanza a 0 dove c è la sqrt nell'obiettivo
# QUINDI aumento o diminuisco le xx/yy/zz in base alle altre 
var : 	xx yy zz := 
0		35 40 40
1		55 20 45
2		40 30 20
;
end;
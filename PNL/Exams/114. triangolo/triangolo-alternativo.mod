reset;
# ampl: model triangolo.mod; option solver snopt; solve;
# objective 596.6915032

# DATI
param nP; # Numero dei punti
set P := 1..nP; # Insieme dei punti
param x {P}; # Coordinate x dei punti
param y {P}; # Coordinate y dei punti

# VARIABILI
# Coordinate dei vertici del triangolo
var xA := 0;
var yA := 0;
var xB := 1;
var yB := 1;
var xC := 2;
var yC := 2;
# Distanza tra i vertici del triangolo
var AB = sqrt((xA - xB)^2 + (yA - yB)^2);
var BC = sqrt((xB - xC)^2 + (yB - yC)^2);
var CA = sqrt((xC - xA)^2 + (yC - yA)^2);
var dA {i in P} = sqrt((x[i] - xA)^2 + (y[i] - yA)^2);
var dB {i in P} = sqrt((x[i] - xB)^2 + (y[i] - yB)^2);
var dC {i in P} = sqrt((x[i] - xC)^2 + (y[i] - yC)^2);

# VINCOLI
s.t. TriangoloEquilatero1 : AB = BC;
s.t. TriangoloEquilatero2 :	BC = CA;
s.t. TriangoloEquilatero3 :	CA = AB;
s.t. PuntiInterni1 {i in P} : dA[i] <= AB;
s.t. PuntiInterni2 {i in P} : dB[i] <= BC;
s.t. PuntiInterni3 {i in P} : dC[i] <= CA;

# OBIETTIVO
minimize z: sqrt(3)/4 * AB^2;

#################
data;
param nP := 5;
param: 	x	y :=
1		24	-17
2		15	14
3		-2 	0
4		21	20
5		18	-6
;
end;
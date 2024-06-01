reset;
# DATI
param xP; # Ascissa vetta da scavalcare [m]
param yP; # Ordinata vetta da scavalcare [m]
param q; # Ordinata del pianoro da colpire [m]
param g; # Accelerazione di gravità [m/s^2]
param v; # Velocità iniziale [m/s]
param xmax; # Massima ascissa batteria [m]

# VARIABILI
var x0 <= xmax; # Ascissa della batteria [m]
var alfa1 >= 0, <= 3.14/2; # Angolo di tiro prima parabola [radianti]
var alfa2 >= 0, <= 3.14/2; # Angolo di tiro seconda parabola [radianti]
var x1; # Minima ascissa colpita [m]
var x2; # Massima ascissa colpita [m]
# Variabili ausiliarie
# Coefficienti parabole
var a1 = g / (2 * (v * cos(alfa1))^2);
var b1 = tan(alfa1) - g * x0 / (v * cos(alfa1))^2;
var c1 = g * x0^2 / (2 * (v * cos(alfa1))^2) - x0 * tan(alfa1);
var a2 = g / (2 * (v * cos(alfa2))^2);
var b2 = tan(alfa2) - g * x0 / (v * cos(alfa2))^2;
var c2 = g * x0^2 / (2 * (v * cos(alfa2))^2) - x0 * tan(alfa2);
# Quota in x = xP
var quotaP1 = a1 * xP^2 + b1 * xP + c1;
var quotaP2 = a2 * xP^2 + b2 * xP + c2;
# Quota punti di caduta
var y1 = a1 * x1^2 + b1 * x1 + c1;
var y2 = a2 * x2^2 + b2 * x2 + c2;
# VINCOLI
# Superamento vetta montagna
subject to Parabola1: quotaP1 >= yP;
subject to Parabola2: quotaP2 >= yP;
# Calcolo del punto di caduta
subject to Punto1: y1 = q;
subject to Punto2: y2 = q;
# Scelta del punto di intersezione oltre la cresta montuosa 
subject to Secondopunto1: x1 >= xP;
subject to Secondopunto2: x2 >= x1;
# OBIETTIVO
maximize z: x2 - x1;

data;
param xP := 10000;
param yP := 350;
param q := 200;
param g := -9.81;
param v := 100;
param xmax := 9500;
end;

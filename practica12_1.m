%% Práctica 12.1. Diseño y análisis de un filtro digital IIR con respuesta arbitraria en frecuencia 

clc, close all, clear all
n = 10; % orden del filtro
Fmax = 1000;
% Vector de frecuencia normalizado:
f = [0 100 200 300 330 380 500 800 Fmax] /Fmax;
% Vector de ganancias:
m=[0 0 1 1 0.7 0.7 2 2 0];
% Función de Matlab que encuentra los coeficientes del filtro IIR:
[b,a] = yulewalk (n,f,m);
% respuesta ideal superpuesta con al respuesta real obtenida con un orden n = 10:
hold on
plot(f,m,'k'); % respuesta ideal
h1 = freqz(b,a,256);
w = (1:256)/256;
plot(w,abs(h1),'r'); % respuesta real obtenida 
xlabel(' Frequencia Relativa');
title('Comparación entre las respuestas ideal y real')
legend('ideal','real'), grid minor

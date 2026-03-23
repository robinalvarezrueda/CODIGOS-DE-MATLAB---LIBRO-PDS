%% PRÁCTICA 5.5 Regresión polinomial sin uso de funciones predefinidas.

close all; clear all; clc;
%Mediciones y en el tiempo t:
t = [1 2 3 4 5]'; 
y = [5.5 43.1 128 290.7 498.4]';
% Regresión Polinomial:
X = [ones(size(t))  t  t.^2 t.^3]
% Solución usando el operador backslash: 
a = X\y
% Ahora se evalúa en una serie más fina de puntos: 
T = (0:0.1:5)';
Y = [ones(size(T))  T  T.^2 T.^3]*a;
plot(T,Y,'-',t,y,'o')
title('Regresión polinomial sin uso de polyfit'), legend('Datos','Regresión Polinomial'), grid on

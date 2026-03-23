%% PRÁCTICA 2.5. Generación de una sinusoide rectificada completa.

clc, clear all, close all 
Amax=0.5;
Fo=500; 
T=1/Fo; 
duracion=2*T; 
Ts=T/100;  
tn=0:Ts:duracion;  %vector de tiempo discreto   
y=Amax*sin(2*pi*Fo*tn); % Vector de amplitudes: 
% La onda rectificada completa es obtenida al invertir los semiciclos negativos por medio del comando abs: 
y_abs=abs(y);   
% Verificación visual: 
figure % Abre una nueva ventana de gráfico. 
stem(tn,y_abs) % Grafica el Eje del Tiempo vs. Eje de Amplitudes. 
grid on % Agrega las divisiones menores en el fondo del gráfico. 
xlabel('Tiempo(seg)') % Titulo del Eje X 
ylabel('Amplitud') % Titulo del Eje Y 
title('Onda Rectificada Completa') % Titulo del Gráfico 
% Verificación auditiva:  
%Fs = 1/Ts; 
% sound (y_abs, Fs) 


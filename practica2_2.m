%% PRÁCTICA 2.2. Generación y análisis de una señal cuadrada.
clc, clear all, close all
Amax=1; %Amplitud
Fo=2000; %Frecuencia
T=1/Fo; %periodo
fi=pi; %fase inicial
duracion=2*T; %duración de la onda
Ts=T/100;  %Período de muestreo
tn=0:Ts:duracion; %Vector de tiempo discreto
Fs=1/Ts; %velocidad con la que se envía hacia el puerto de audio
yn=Amax*square(2*pi*Fo*tn,50); % vector de amplitudes
plot(tn,yn,'m','LineWidth',2);grid on  
ylim([-2,2]); xlabel('Tiempo (s)'); ylabel('Amplitud'); 
title('Onda cuadrada de 2 KHz') 
Fs = 1 / Ts;
%sound (y1, Fs) % envío del vector de sonido hacia el puerto de salida

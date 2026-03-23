%% PRÁCTICA 4.6. Generación de eco simple en una señal de audio.

clc,close all,clear all
[y,Fs]=audioread('HolaComoEstas.wav');
y1=y(:,1); % En muestras
% Introducción de eco:
tiempo_retardo=0.3; % En segundos
retardo_muestras=tiempo_retardo*Fs; % Factor de conversión: Fs(muest/seg)
% Se añade a la señal original, la misma señal pero retardada y de menor amplitud:
%y_eco = [canal_izquierdo_original' zeros(1, retardo)] + 0.7*[zeros(1,retardo) canal_izquierdo_original'];
y1_original_ceros = [y1'  zeros(1,retardo_muestras)];
eco = 0.5*[zeros(1, retardo_muestras) y1'];
y_eco = y1_original_ceros + eco;
figure
subplot(3,1,1)
plot (y1_original_ceros,'k')
title('canal izquierdo original con el retardo añadido al final')
subplot(3,1,2)
plot (eco, 'b')
title('eco: canal izquierdo original con el retardo añadido en el inicio y de menor amplitud')
subplot(3,1,3)
plot (y_eco,'r'), title('canal izquierdo original sumado el eco')
sound(y_eco,Fs)   % Antes, quitar toda gráfica.

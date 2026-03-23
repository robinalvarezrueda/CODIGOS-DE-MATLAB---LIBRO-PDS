%% PRÁCTICA 4.2. Lectura, visualización y reproducción de un archivo de audio.

clc, close all, clear all;
% Señal ya discretizada:  audio
[y Fs] = audioread ('hola.wav'); 
y1 = y(:,1); %separación del canal 1
y2 = y(:,2); %separación del canal 2
duracion = length(y1) / Fs;
Ts= 1/ Fs; 
%Base de tiempos discreto en segundos:
tn = Ts:Ts:duracion; 
% Gráfico de los dos canales superpuestos:
hold on
plot(tn, y1)
plot(tn, y2)
title(' Señal adquirida con una Fs de 8 KHz')
xlabel('tn(segundos)')

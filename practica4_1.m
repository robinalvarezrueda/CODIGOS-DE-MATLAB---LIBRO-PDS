%% PRÁCTICA 4.1. Adquisición y almacenamiento básico de audio.

clear all;close all;clc;
bloque_adquisicion=1.5;
Fs=8000;
disp('GRABANDO...')
% Crear un objeto con parámetros: Fs, 16 bits, 1 canal (de los 2 posibles)
y=audiorecorder(Fs,16,2);%Creación del objeto para obtención de señal
% Uso del objeto: adquiere señal en bloques de "bloque_adquisicion" en segundos:
recordblocking(y, bloque_adquisicion); 
% GETAUDIODATA: recupera la señal almacenada:
senial=getaudiodata(y, 'single');
L=length(senial);%Obtención de tamaño de señal
t=linspace(0,bloque_adquisicion,L);%creación del vector tiempo
plot(t,senial);grid minor;
title('Señal adquirida con una Fs = 8 KHz')
xlabel('tn(segundos)')
% Grabación de la señal adquirida:
audiowrite('hola.wav', senial, Fs);
% Información del archivo grabado:
info = audioinfo('hola.wav')

%% PRÁCTICA 6.20. APLICACIÓN DE LA DFT VECTORIAL AL ANÁLISIS DE UNA SEÑAL DE AUDIO

clc, close all, clear all;
[y Fs] = audioread ('Original.wav'); % Lectura de señal
y = y(:,1); %separacion de un canal
% Solo se tienen los primeros 10000 puntos y así se evita el mensaje OUT OF MEMORY
y = y(1:10000); 
xn = y'; % clave para la dft … tiene que ser un VECTOR FILA
duracion = length(y)/Fs;
Ts= 1/ Fs;
n = Ts:Ts:duracion; %Base de tiempos
plot(n, xn)
title(' Señal discretizada'), xlabel('t(segundos)')
% Dominio de la frecuencia:
N = length (xn);
Xk = dft_vectorial (xn,N);
Espectro_amplitudes = abs(Xk);
f=linspace(0,Fs, length(xn)); % Grafica en el dominio de la frecuencia
figure
plot(f,Espectro_amplitudes)
title('Espectro de amplitudes'), xlabel('f(Hz)')
%Visualización solo hasta Fs/2:
figure
plot(f,Espectro_amplitudes)
axis([0 Fs/2 0 max(Espectro_amplitudes)]); title('Espectro de amplitudes'), xlabel('f(Hz)')

%% PRÁCTICA 6.11b. DFT de una señal sinusoidal

clc, close all, clear all;
% La duración debe ser al menos un período de la señal
% como Fo = 1 Hz, entonces, al menos sería 1 segundo.
Fo = 1;
duracion =1; 
% Como Fo = 1 Hz, entonces Fmax = 1.
Fmax = 1; 
% Teorema del muestreo: se supone un factor de 10
Fs = 10*Fmax; 
Ts= 1/ Fs;
%Base de tiempos:
n = Ts:Ts:duracion;
% Señal muestreada en los valores del tiempo discreto 
xn = sin(2*pi*Fo*n);
% Grafica en el dominio del tiempo:
stem(n, xn,'r', 'linewidth',3)
title(' Señal discretizada')
xlabel('t(segundos)')
% Dominio de la frecuencia: DFT
N = length (xn);
Xk = dft_vectorial (xn);
Espectro_amplitudes= abs(Xk);
Espectro_amplitudes_normalizado = Espectro_amplitudes/max(Espectro_amplitudes);
% Grafica de la DFT normalizada:
% Eje de frecuencias:
f=linspace(0,Fs, length(xn));
figure
stem(f,Espectro_amplitudes_normalizado)
title('Espectro de amplitudes normalizado')
xlabel('f(Hz)')
%Visualización de la DFT normalizada solo hasta Fs/2:
figure
stem(f,Espectro_amplitudes_normalizado)
axis([0 Fs/2 0 max(Espectro_amplitudes_normalizado)])
title('Espectro de amplitudes normalizado - desde cero hasta Fs/2')
xlabel('f(Hz)')
grid minor

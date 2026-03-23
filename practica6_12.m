%% PRÁCTICA 6.12. DFT de una señal cuadrada bipolar.

clc, close all, clear all;
% La duración debe ser al menos un período de la señal
% como Fo = 1 Hz, entonces, al menos sería 1 segundo.
Fo = 1;
duracion =1; 
% Como Fo = 1 Hz, si se considera una Fmax = 100, se producirá un aliasing imperceptible
Fmax = 100; 
% Teorema del muestreo: se supone un factor de 20 para logra buena exactitud en la ubicación de las componentes
Fs = 20*Fmax; 
Ts= 1/ Fs;
%Base de tiempos:
n = Ts:Ts:duracion;
% Señal muestreada en los valores del tiempo discreto 
xn = square(2*pi*Fo*n);
% Grafica en el dominio del tiempo:
stem(n, xn,'b', 'linewidth',3)
title(' Señal discretizada')
xlabel('t(segundos)')
% Dominio de la frecuencia: DFT
N = length (xn);
Xk = dft_vectorial (xn);  % N coeficientes complejos
Espectro_amplitudes= abs(Xk);  % Módulos de los N coeficientes complejos
Espectro_amplitudes_normalizado = Espectro_amplitudes/max(Espectro_amplitudes);
% Grafica de la DFT normalizada:
% Eje de frecuencias:
f=linspace(0,Fs, length(xn));
%Visualización de la DFT normalizada solo hasta Fs/2:
figure
stem(f,Espectro_amplitudes_normalizado)
axis([0 Fs/2 0 max(Espectro_amplitudes_normalizado)])
title('Espectro de amplitudes normalizado - desde cero hasta Fs/2')
xlabel('f(Hz)'), grid minor

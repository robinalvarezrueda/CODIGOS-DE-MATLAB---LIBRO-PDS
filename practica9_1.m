%% PRÁCTICA 9.1. Aparición de la SINC en el periodograma de una señal monocomponente.

clc, clear all, close all
f1=100;
duracion=0.1;
Fmax = f1;
Fs=10*Fmax; 
Ts=1/Fs;
n=0:Ts:duracion; % base de tiempos (discreto)
xn=sin(2*pi*f1*n); % vector de amplitudes
% Grafica (dominio del tiempo)
subplot(2,1,1)
plot(n,xn), grid minor
title('Gráfica dominio del tiempo'); xlabel('t[s]'); ylabel('Amplitud')
%% Dominio de frecuencia (periodograma)
N=length(xn); % numero de muestras de la señal discretizada
FACTOR = 256;
nFFT=2^(ceil(log2(N)))*FACTOR;
Xn = fft(xn,nFFT); % nFFT complejos
% Periodograma = modulo(fft)
periodograma_1=abs(Xn); % Xn tiene nFFT puntos
% Eje de frecuencias
f=linspace(0,Fs,nFFT);
% Gráfica (periodograma)
subplot(2,1,2)
plot(f,periodograma_1); grid minor
axis([0 Fs/2 0 max(periodograma_1)]);% Xmin Xmax Ymin Ymax
title('Periodograma'); xlabel('f[Hz]'); ylabel('Amplitud') 

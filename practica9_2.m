%% PRÁCTICA 9.2. Resolución en frecuencia del periodograma en función de la duración de la señal

clc, clear all, close all
f1=100;
f2=107;
duracion=0.1; 
Fs=10*f2; 
Ts=1/Fs;
% base de tiempos (discreto)
tn=0:Ts:duracion;
% vector de amplitudes
xn=sin(2*pi*f1*tn)+sin(2*pi*f2*tn);
% grafica (dominio del tiempo)
figure(1)
subplot(2,1,1)
plot(tn,xn)
grid on; grid minor
title('Gráfica dominio del tiempo'); xlabel('t[s]'); ylabel('Amplitud')
% Dominio de frecuencia (periodograma)
N=length(xn); % numero de muestras de la señal discretizada
FACTOR = 128;
nFFT=2^(ceil(log2(N)))*FACTOR;
Xn = fft(xn,nFFT); % nFFT complejos
% Periodograma = modulo(fft)
periodograma_1=abs(Xn); % Xn tiene nFFT puntos
% Eje de frecuencias
f=linspace(0,Fs,nFFT);
% Gráfica (periodograma)
subplot(2,1,2)
plot(f,periodograma_1); grid on; grid minor
axis([0 Fs/2 0 max(periodograma_1)]);% Xmin Xmax Ymin Ymax
title('Periodograma'); xlabel('f[Hz]'); ylabel('Amplitud') 

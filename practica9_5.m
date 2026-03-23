%% PRÁCTICA 9.5. Determinación experimental de la capacidad de detección del periodograma.

clc, close all, clear all
duracion = 0.5;
f1 = 100;
f2 = 200;
Fmax = 200;
Fs = 20*Fmax;
Ts = 1/Fs;
%% DOMINIO DEL TIEMPO: 
tn = Ts:Ts:duracion;
k = 0.01; % amplitud de la segunda componente
y = 1*sin(2*pi*f1*tn) + k*sin(2*pi*f2*tn);
subplot(2,1,1);
plot(tn,y);
title('SEÑAL EN EL DOMINIO DEL TIEMPO');
xlabel('tiempo [s]');
ylabel('Amplitud');
grid minor;
%% DOMINIO DE LA FRECUENCIA:
N = length(y);
nFFT = 2^ceil(log2(N))*64; % Cálculo de nFFT (muestras en el tiempo)
Xn = fft(y, nFFT); % Cálculo de los complejos FFT
% Cálculo del Periodograma:|
Periodograma = abs(Xn);   
f = linspace(0, Fs, nFFT);
subplot(2,1,2);
plot(f, Periodograma, 'color', 'm');
grid minor
title('PERIODOGRAMA');
xlabel('Frecuencia [Hz]');
ylabel('Amplitud');
axis([0 Fs/2 0 max(Periodograma)]);

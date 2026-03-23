%% PRÁCTICA 6.14. DFT de una onda diente de sierra bipolar.

clc, close all
Fo = 1; % Frecuencia fundamental
duracion = 1; 
Fmax = 100; % Como Fo = 1 Hz, si se considera una Fmax = 100, se producirá un aliasing imperceptible
Fs = 20*Fmax;
Ts = 1/Fs;
tn = Ts:Ts:duracion;
xn=sawtooth(2*pi*Fo*tn);
Xk = dft_vectorial(xn);
frecuencias = abs(Xk);
frecuencias_norm = frecuencias/max(frecuencias);
f = linspace(0, Fs, length(xn));
stem(tn,xn,'c','MarkerFaceColor','c','MarkerSize',6)
title('Señal cuadrada discretizada')
xlabel('f(Hz)')
axis([0 1 -1 1])
figure
stem(f,frecuencias_norm,'LineWidth',1.2)
title('Espectro de amplitudes normalizado')
xlabel('f(Hz)')
axis([0 Fs/2 0 1])
grid minor

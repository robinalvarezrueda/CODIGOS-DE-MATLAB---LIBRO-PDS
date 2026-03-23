%% PRÁCTICA 6.14. DFT de una onda diente de sierra bipolar.

clc, close all
F1=1, F2=2, F3=3;
Fmax = F3;
duracion = 1;
Fs = 30*Fmax;
Ts = 1/Fs;
t = Ts:Ts:duracion;
xn = sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t);
Xk = dft_vectorial(xn);
frecuencias = abs(Xk);
frecuencias_norm = frecuencias/max(frecuencias);
f = linspace(0, Fs, length(xn));
stem(t,xn,'b','MarkerFaceColor','c','MarkerSize',6)
title('Señal compuesta por tres tonos')
xlabel('t(s)')
axis([0 1 -3 3])
grid minor
figure
stem(f,frecuencias_norm,'LineWidth',1.2)
title('Espectro de amplitudes normalizado')
xlabel('f(Hz)')
axis([0 Fs/2 0 1])
grid minor

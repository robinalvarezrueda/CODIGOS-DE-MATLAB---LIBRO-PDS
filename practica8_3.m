%% PRÁCTICA 8.3. Análisis espectral de una señal chirp lineal

clc, clear all, close all
duracion = 10;                                                    %Duración de nuestra señal
freq1 = 1000;                                                      %Frecuencia inicial de la señal
freq2 = 2000;                                                      %Frecuencia final de la señal
Fmax = freq2;                                                     %Frecuencia máxima de la señal     
Fs = 20*Fmax;                                                    %Frecuencia de muestreo de la señal
Ts = 1/Fs;                                                            %Tiempo de muestreo de la señal
tn = Ts:Ts:duracion;                                            %Vector del tiempo de la señal
senial_chirp = chirp(tn,freq1,duracion,freq2);      %Función chirp con las dos frecuencias
xn=senial_chirp;
plot(tn,xn)
%% Dominio de la frecuencia:
N = length(xn);
nFFT = 2^ceil(log2(N))*128; % Cálculo de nFFT 
%Aplico la función  FFT de matlab
Xn1=fft(xn,nFFT);
% Se calcula el módulo de los complejos llamado PERIODOGRAMA
Periodograma=abs(Xn1);
%Cálculo del EJE de frecuencias: misma cantidad de puntos que PERIODOGRAMA y que están entre 0 y Fs:
f=linspace(0,Fs,nFFT);
% Con los dos ejes listos, ya solo graficamos:
figure
plot(f,Periodograma);
% Por simetría de medio período, solo nos interesa visualizar la mitad del PERIDODOGRAMA:
axis([0 Fs/2 0 max(Periodograma)]) 
xlabel('F(Hz)'), ylabel ('Amplitud')
title('PERIODOGRAMA en base a la FFT de Matlab')
grid minor

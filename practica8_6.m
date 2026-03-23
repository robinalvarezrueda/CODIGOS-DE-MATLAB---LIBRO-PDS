%% PRÁCTICA 8.6. Obtención de la amplitud espectral asociada a una frecuencia dada

clc, close all, clear all; 
duracion =5;
Fmax = 125;
Fs = 10*Fmax;
Ts= 1/ Fs;
%Base de tiempos:
t = Ts:Ts:duracion;
% Señal muestreada
xn=1*sin(2*pi*100*t)+0.8*sin(2*pi*105*t)+...
  0.6*sin(2*pi*110*t)+0.4*sin(2*pi*115*t)+...
  0.2*sin(2*pi*120*t)+0.1*sin(2*pi*125*t);
% Grafica en el dominio del tiempo:
plot(t, xn)
title(' Señal discretizada')
xlabel('t(segundos)')
%% Dominio de la frecuencia:
N = length(xn);
nFFT = 2^ceil(log2(N))*128; % Cálculo de nFFT 
%Aplico la función  FFT de matlab
Xn1=fft(xn,nFFT);
% Se calcula el módulo de los complejos llamado PERIODOGRAMA
Periodograma =abs(Xn1);
Periodograma_normalizado = Periodograma / max(Periodograma);
%Cálculo del EJE de frecuencias: misma cantidad de puntos que PERIODOGRAMA y que están entre 0 y Fs:
f=linspace(0,Fs,nFFT);
% Con los dos ejes listos, ya solo graficamos:
stem(f,Periodograma_normalizado);
% Por simetría de medio período, solo nos interesa visualizar la mitad del PERIDODOGRAMA:
axis([0 Fs/2 0 max(Periodograma_normalizado)]) 
xlabel('F(Hz)'), title('PERIODOGRAMA en base a la FFT de Matlab'), grid minor
%%  Pmax e índice en el que se da y la frecuencia correspondiente (Fmax):
[Pmax, indice]=max(Periodograma_normalizado); %  Devuelve el máximo y el índice del vector.
Fmax = f (indice); %  Se busca ese índice en el vector de frecuencia.
%% Al revés: conocida una Fo, se desea calcular el eje vertical correspondiente:
Fo = 98;
Indice_eje_horizontal_Fo = floor (Fo * nFFT / Fs); % con floor no dio bien
Valor_eje_vertical = Periodograma_normalizado (Indice_eje_horizontal_Fo);

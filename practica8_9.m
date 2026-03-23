%% PRÁCTICA 8.9. Análisis espectral por bandas en señales de audio

clc, close all, clear all;
% Señal ya discretizada:  audio
[xn Fs] = audioread ('ArjonaOriginal.wav');
xn = xn(:,1); %separacion de un canal
duracion = length(xn)/Fs;
Ts= 1/ Fs;
%Base de tiempos:
tn = Ts:Ts:duracion;
plot(tn, xn)
title(' Señal de audio')
xlabel('t(segundos)'), grid minor
%% Dominio de la frecuencia:
N = length (xn);
nFFT=2^(ceil(log2(N)))*1; 
% Se aplica la función  FFT de Matlab
Xn=fft(xn,nFFT); % Complejos
% Se calcula el PERIODOGRAMA (módulo de los complejos)
Periodograma=abs(Xn);
%Se normaliza el periodograma
Periodograma_normalizado=Periodograma/max(Periodograma);
% Extracción de la mitad del espectro (simetría de medio período):
P=Periodograma_normalizado(1:nFFT/2+1); 
%Eje de frecuencias:
f=Fs*(0:(nFFT/2))/nFFT; 
figure
plot(f,P)
title(' Espectro de la señal de audio')
xlabel('f(Hz)'), grid minor
%CÁLCULO DEL ÁREA EN LA BANDA 1:
% Banda 1: v1 = 200, v2=300
v1 = 200; 
v2=300;
P_A1=P(find(f>=v1 & f<=v2));
% Área bajo la curva en el intervalo:
Area_banda1_suma=sum(P_A1);
Area_banda1_trapz= trapz(P_A1);
%CÁLCULO DEL ÁREA EN LA BANDA 2:
v3 = 600;
v4=700;
P_A2=P(find(f>=v3 & f<=v4));
% Área bajo la curva en el intervalo:
Area_banda2_suma=sum(P_A2);
Area_banda2_trapz= trapz(P_A2);

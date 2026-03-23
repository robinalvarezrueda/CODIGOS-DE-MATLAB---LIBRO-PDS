%% PRÁCTICA 9.6. Periodograma de una ventana rectangular y origen de la fuga espectral

clc, clear all, close all
L = 24; % Longitud de la ventana
%xn = mi_rectangular(L);
%xn = rectwin(L);
xn=ones(1,L);
%% DOMINIO DE LA FRECUENCIA:
N=length(xn);
nFFT = 2^ceil(log2(N))*128; % Cálculo de nFFT (muestras en el tiempo)
%PERIODOGRAMA SIMPLE
Xn=fft(xn,nFFT);
P=(abs(Xn));
% Creación del eje de frecuencias normalizado igual que wvtool:
f = 1:1:nFFT;
f_norm = f/(nFFT/2);
subplot(1,2,1); 
plot(xn,'x');  
title('Ventana rectangular (L = 25) en el dominio del tiempo');  
xlabel('Muestras');  
ylabel('Amplitud');  
axis([-10 30 0 max(xn)+1]);  grid minor
subplot(1,2,2);  
plot(f_norm,P);  
title('Dominio de frecuencia de la ventana rectangular');  
xlabel('Frecuencia Normalizada');  
axis([0 1 min(P)-5 max(P)+5]); grid minor

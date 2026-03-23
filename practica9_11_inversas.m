%% PRÁCTICA 9.11. Ventanas inversas.

clc, clear all, close all
L=25;
% creacion de las VENTANAS INVERSAS
ventana1=mi_rectangular(L); %ventana de referencia
ventana2=1-mi_triangular(L);
ventana3=1-mi_hamming(L);
ventana4=1-mi_hann(L);
ventana5=1-mi_bh4(L);
%ventanas en un solo plot
subplot(2,1,1)
hold on
plot(ventana1, 'b')
plot(ventana2, 'k')
plot(ventana3, 'r')
plot(ventana4, 'g')
plot(ventana5, 'c')
legend('rectangular','(1- Triangular)','(1-Hamming)','(1-Hann)','(1-BH4)')
title('Dominio del tiempo de las VENTANAS INVERSAS');  
xlabel('Muestras');  
ylabel('Amplitud');  
grid on
%% DOMINIO DE LA FRECUENCIA:
N=length(ventana1);
nFFT = 2^ceil(log2(N))*1; % Cálculo de nFFT (muestras en el tiempo)
%PERIODOGRAMAS SIMPLES:
P1=20*log10(abs(fft(ventana1,nFFT)));
P2=20*log10(abs(fft(ventana2,nFFT)));
P3=20*log10(abs(fft(ventana3,nFFT)));
P4=20*log10(abs(fft(ventana4,nFFT)));
P5=20*log10(abs(fft(ventana5,nFFT)));
% Eje de frecuencias normalizado igual que wvtool:
f = 1:1:nFFT;
f_norm = f/(nFFT/2);
subplot(2,1,2); 
hold on
plot(f_norm,P1,'b');  
plot(f_norm,P2,'k');  
plot(f_norm,P3,'r');  
plot(f_norm,P4,'g'); 
plot(f_norm,P5,'c'); 
legend('rectangular','(1- Triangular)','(1-Hamming)','(1-Hann)','(1-BH4)')
title('Dominio de frecuencia de las VENTANAS INVERSAS');  
ylabel('Magnitud en (dB)');  
xlabel('Frecuencia Normalizada');  
axis([0 1 -150 max(P1)+5]);
grid on

%% PRÁCTICA 9.10. Comparación espectral entre diferentes ventanas temporales

clc, clear all, close all
L=25;
% creacion de las ventanas
ventana1=mi_rectangular(L);
ventana2=mi_triangular(L);
ventana3=mi_hamming(L);
ventana4=mi_hann(L);
ventana5=mi_bh4(L);
%ventanas en un solo plot
subplot(2,1,1)
hold on
plot(ventana1, 'b')
plot(ventana2, 'k')
plot(ventana3, 'r')
plot(ventana4, 'g')
plot(ventana5, 'c')
legend('rectangular','triangular','hamming','hann','bh4')
title('Ventana en el dominio del tiempo');  xlabel('Muestras');  ylabel('Amplitud');  grid on
%% DOMINIO DE LA FRECUENCIA:
N=length(ventana1);
nFFT = 2^ceil(log2(N))*128; % Cálculo de nFFT (muestras en el tiempo)
%PERIODOGRAMAS SIMPLES:
Xn1=fft(ventana1,nFFT);
Xn2=fft(ventana2,nFFT);
Xn3=fft(ventana3,nFFT);
Xn4=fft(ventana4,nFFT);
Xn5=fft(ventana5,nFFT);
P1=20*log10(abs(Xn1));
P2=20*log10(abs(Xn2));
P3=20*log10(abs(Xn3));
P4=20*log10(abs(Xn4));
P5=20*log10(abs(Xn5));
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
legend('rectangular','triangular','hamming','hann','bh4')
title('Dominio de frecuencia');  
ylabel('Magnitud en (dB)');  xlabel('Frecuencia Normalizada');  axis([0 1 -150 max(P1)+5]); grid on

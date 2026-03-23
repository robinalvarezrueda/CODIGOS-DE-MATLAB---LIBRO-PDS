%% PRÁCTICA 9.11. Mejora de la capacidad de detección mediante el periodograma modificado.

clc, close all, clear all
duracion=1;
fmax=200;
Fs=10*fmax;
Ts=1/Fs;
tn=0:Ts:duracion;
yn=sin(2*pi*tn*100)+0.0000001*sin(2*pi*tn*200);
plot(tn,yn); xlabel('t(segundos)'), title('Señal original en el dominio del tiempo')
%% Dominio de la frecuencia 
N=length(yn);
nFFT = 2^ceil(log2(N))*2; % Cálculo de nFFT (muestras en el tiempo)
ventana1=rectwin(N);
ventana2=triang(N);
ventana3=hamming(N);
ventana4=hann(N);
ventana5=blackmanharris(N);
% Enventanado
yn_vent1=yn.*ventana1';
yn_vent2=yn.*ventana2';
yn_vent3=yn.*ventana3';
yn_vent4=yn.*ventana4';
yn_vent5=yn.*ventana5';
figure, 
plot(tn,yn_vent5);
xlabel('t(segundos)'), 
title('Señal original enventanada con Blackman Harris de 4 términos'), 
grid minor
periodograma1=10*log10(abs(fft(yn_vent1,nFFT))); % implícito para una ventana rectangular
periodograma2=10*log10(abs(fft(yn_vent2,nFFT)));
periodograma3=10*log10(abs(fft(yn_vent3,nFFT)));
periodograma4=10*log10(abs(fft(yn_vent4,nFFT)));
periodograma5=10*log10(abs(fft(yn_vent5,nFFT)));
f=linspace(0,Fs,nFFT);
figure, 
hold on 
plot(f,periodograma1,'b');
plot(f,periodograma2,'k');
plot(f,periodograma3,'g');
plot(f,periodograma4,'r');
plot(f,periodograma5,'c');
legend('rectangular','triangular','hamming', 'hann', 'blackmanharris');
title('Superposición de periodogramas'), xlabel ('f(Hz)'), xlim([80 220]), 
grid minor


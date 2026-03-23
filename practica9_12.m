%% PRÁCTICA 9.12. Mejora de la resolución en frecuencia mediante ventanas inversas.

clc, close all, clear all
duracion=0.1;
F1= 100;
F2= 106;
Fmax=F2;
Fs=10*Fmax;
Ts=1/Fs;
tn=0:Ts:duracion;
yn=sin(2*pi*tn*F1)+1*sin(2*pi*tn*F2);
subplot(3,1,1)
plot(tn,yn); xlabel('t(seg)')
title('Señal original en el dominio del tiempo: xn'), grid minor
%% Dominio de la frecuencia 
N=length(yn);
nFFT = 2^ceil(log2(N))*256; % Cálculo de nFFT (muestras en el tiempo)
% FUNCIONES DIRECTAS DE MATLAB:
ventana_inversa=1-hamming(N);
% Enventanado:
yn_vent=yn.*ventana_inversa';
subplot(3,1,2)
plot(yn_vent)
title('Señal enventanada: xn * (1-Hamming)'), xlabel('F(Hz)'), grid minor
%% DOMINIO DE FRECUENCIA:
periodograma=(abs(fft(yn,nFFT))); % implícita la multiplicación por una ventana rectangular.
periodograma1=(abs(fft(yn_vent,nFFT)));
f=linspace(0,Fs,nFFT);
subplot(3,1,3)
hold on 
plot(f,periodograma,'k');
plot(f,periodograma1,'r');
legend('rectangular', 'Per. Modif.(1-hamming)');
title('Periodograma Simple VS Periodograma Modificado con (1-Hamming)')
xlabel('F(Hz)'), xlim([0 Fs/2]); grid minor

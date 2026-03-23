%% PRÁCTICA 6.19. DFT vectorial aplicado a una señal multisinusoidal

clc, clear all, close all
Fmax = 125;
Fs=10*Fmax;                          %Frecuencia de muestreo
Ts=1/Fs;                         %Período de muestreo
N=1000;                            %Longitud de la señal
t=0:Ts:(N-1)*Ts;                 %Vector del tiempo
%SEÑAL A SER ANALIZADA:
xn =1*sin(2*pi*100*t)+0.8*sin(2*pi*105*t)+0.6*sin(2*pi*110*t)+0.4*sin(2*pi*115*t)+0.2*sin(2*pi*120*t)+0.1*sin(2*pi*125*t);
%GRAFICACIÓN DE LA SEÑAL EN EL DOMINIO DEL TIEMPO
plot(t,xn,'LineWidth',1.5)                          %Señal en el dominio del tiempo
xlabel('t(segundos)');                              %Magnitud en Eje X
ylabel('Amplitud (mV)');                            %Magnitud en Eje Y
title('Señal en el dominio del tiempo');            %Título de la gráfica
grid minor
%----------SEÑAL SENOIDAL EN EL DOMINIO DE LA FRECUENCIA----------
%% DOMINIO DE LA FRECUENCIA:
Xk = dft_vectorial(xn);
Espectro_amplitudes= abs(Xk);
Espectro_amplitudes_normalizado = Espectro_amplitudes/max(Espectro_amplitudes);
% Grafica de la DFT normalizada:
% Eje de frecuencias:
f=linspace(0,Fs, length(xn)); 
figure
stem(f,Espectro_amplitudes_normalizado)
title('Espectro de amplitudes normalizado')
xlabel('f(Hz)')
%Visualización de la DFT normalizada solo hasta Fs/2:
figure
stem(f,Espectro_amplitudes_normalizado)
axis([0 Fs/2 0 max(Espectro_amplitudes_normalizado)])
title('Espectro de amplitudes normalizado - desde cero hasta Fs/2')
xlabel('f(Hz)')
grid minor

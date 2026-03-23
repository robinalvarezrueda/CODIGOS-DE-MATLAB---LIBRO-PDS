%% PRÁCTICA 6.17. DFT de señales mixtas

clc;clear all;close all;
Fo = 1;
Fmax=1;
Fs=20*Fmax;
duracion=2;
Ts= 1/ Fs;
n = Ts:Ts:duracion;
% Generación de la señal
y1=sawtooth(2*pi*Fo*n,0.5);
for i=1:length(y1)
    if y1(i)<0
        y1(i)=0;
    end
end    
y2=cos(2*pi*Fo*n);
for i=1:length(y2)
    if y2(i)<0
        y2(i)=0;
    end
end
y_mixta=y1+y2;
xn=y_mixta;
% Grafica en el dominio del tiempo:
stem(n, xn,'b', 'linewidth',1)
title(' Señal mixta (sinusoidal-triangular)')
xlabel('t(segundos)')
grid on	
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


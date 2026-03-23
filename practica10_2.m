%% PRÁCTICA 10.2. Contaminación de una señal sinusoidal con ruido AWGN y análisis espectral

clear all; close all; clc
% Generación de la señal
duracion = 4;
f1 = 200;
Fmax = f1;
Fs = 10*Fmax;
Ts = 1/Fs;
tn = 0:Ts:duracion;
yn = sin(2*pi*f1*tn);

% Añadiendo ruido a la señal:
SNR = -15; % SNR en dB
yn_ruido = awgn(yn, SNR, 'measured');

%yn_ruido = mi_awgn(yn,SNR);
 
% Gráficas en el dominio del tiempo
hold on
plot(tn,yn,'LineWidth',1.5);
xlabel('Tiempo [s]');
ylabel('Amplitud');
title('Efecto del ruido WGN en una señal sinusoidal');
xlim([0 5/Fmax])
plot(tn,yn_ruido)
legend('Señal original','Señal con ruido')
grid minor
%% Histograma y su mejor ajuste gaussianno:
figure
histfit(yn_ruido,100)
title('Histograma de la señal con ruido WGN')
%% Mediciones de los 4 momentos estadísticos:
% Tendencia central (media aritmética):
promedio = mean(yn_ruido);
% Dispersión (desviación estándar):
desv_est = std(yn_ruido);
% Asimetría (skweness):
asimetria = skewness(yn_ruido);
% Peso en colas (kurtosis):
peso_colas = kurtosis(yn_ruido);
fprintf('El promedio es %.5f\n',promedio)
fprintf('La desviacion estandar es %.5f\n',desv_est)
fprintf('La asimetría es %.5f\n',asimetria)
fprintf('El peso en colas es %.5f\n',peso_colas)
%% Dominio de la frecuencia
N = length(yn);
nFFT = 2^ceil(log2(N));
f = linspace(0, Fs, nFFT);
w = rectwin(N);
ynVent = yn.*w';
Periodograma_Yn = 20*log10(abs(fft(ynVent, nFFT)))*32;
yn_ruido_Vent = yn_ruido.*w';
Periodograma_YN_Ruido = 10*log10(abs(fft(yn_ruido_Vent, nFFT)))*24;
yn_noisyVent = yn_ruido.*w';
Yn_NoisyFFT = 10*log10(abs(fft(yn_ruido_Vent, nFFT)))*32;
% Gráficas en el dominio de la frecuencia
figure;
subplot(2,1,1)
plot(f,Periodograma_Yn);
xlabel('Frecuencia [Hz]');
ylabel('Amplitud [dB]');
title('Periodograma de la Señal Sinusoidal');
axis([0 Fs/2 min(Periodograma_Yn) max(Periodograma_Yn)]);
grid minor;
subplot(2,1,2)
plot(f, Periodograma_YN_Ruido, 'g');
xlabel('Frecuencia [Hz]');
ylabel('Amplitud [dB]');
title('Periodograma de la (señal + Ruido WGN)');
axis([0 Fs/2 min(Periodograma_YN_Ruido) max(Periodograma_YN_Ruido)]);
grid minor;

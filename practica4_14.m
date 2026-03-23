%% PRÁCTICA 4.14. Aplicación del efecto Trémolo en señales de audio

clc,close all,clear all
%% Extracción de la información contenida en el archivo del audio original
[original,Fs]=audioread('acoustic.wav'); % se extrae la información en muestras de los dos canales del audio (ch1hch2) y la frecuencia de muestreo Fs.
original_ch1=original(:,1); % se extrae la información en muestras de uno de los dos canales del audio (ch1).
% Base de tiempo discreto en muestras:
n=1:length(original_ch1);
t_muestras = n/Fs; % vector de tiempo [s]  usando el factor de conversión Fs
s_control = 0.5*sin(20*pi*t_muestras) + 1; % señal que permite variar el volumen de x(n) con cierto patrón y velocidad
s_tremolo = original_ch1 .* s_control'; % Implementación del efecto Trémolo
figure
subplot(3,1,1)
plot (original_ch1,'c')
title('Señal original del audio (canal izquierdo)')
subplot(3,1,2)
plot (s_control,'k')
title('Señal de control (volumen y velocidad)')
subplot(3,1,3)
plot (s_tremolo,'b')
title('Señal del audio con el efecto Trémolo'), xlabel('Tiempo [muestras] - 48k [muestras/s]')
sound(s_tremolo,Fs) % reproducción del audio con el efecto Trémolo

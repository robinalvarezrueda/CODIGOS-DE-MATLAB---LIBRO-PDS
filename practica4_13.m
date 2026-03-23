%% PRÁCTICA 4.13. Aplicación del efecto Flanging mediante retardo variable.

clc,clear all,close all;
% Flanging: Retardo (0 ms - 15 ms),	Sinusoidal (0,1 Hz - 1 Hz)
% Vibrato:	Retardo (5 ms - 10 ms),	Sinusoidal (5 Hz- 14 Hz)
% Chorus:	Retardo (10 ms - 25 ms), Aleatoria
%% Lectura del audio original:
[x,Fs] = audioread('acoustic.wav'); %leemos la forma de onda de la muestra

% Flanging: 
% 1.- Retardo (0 ms - 15 ms):	Vamos a tomar Retardo = 3 (ms):
retardo_maximo_tiempo=0.003; %0.01; %0.003; % 3 (ms) tiempo maximo de retardo
% Convertimos el retardo en tiempo[ms] a retardo máximo en muestras
% Factor de conversión: Fs (muestras / seg):
retardo_maximo_muestras=round(retardo_maximo_tiempo*Fs); 

% 2.- Sinusoidal de Fo (0,1 Hz - 1 Hz): Vamos a tomar sinusoide de 1 (Hz)
Fo = 10; % frecuencia de flanger en Hz
% Base de tiempo discreto en muestras:
n=1:length(x);
% Base de tiempo discreto en segundos: factor de conversión la Fs: n/Fs
retardo_variable_sinusoidal = (sin(2*pi*n/Fs))';  

% Suma de la señal original más la original con retardo variable:
% y(n)=x(n)+ x(n+d(n)); 
y = zeros(length(x),1); % Creamos un vector vacío
% Las primeras muestras:
y(1:retardo_maximo_muestras)=x(1:retardo_maximo_muestras);  

% Las siguientes muestras:añadimos retardo a cada muestra
for i = (retardo_maximo_muestras+1):length(x)
    senial_retardada=ceil((retardo_variable_sinusoidal(i))*retardo_maximo_muestras);  % Generamos retardo a partir de (1-max_samp_delay) y aseguramos un número entero  
    y(i) = x(i) + x(i-senial_retardada);   % Añadimos muestra retardada
end
%% Verificación auditiva de la creación de la señal que contiene el efecto Flanger
%sound(x,Fs) % reproducción del audio original
sound(y,Fs); % reproducción del audio con el efecto Flanger
%% Graficos
figure;
subplot(2,1,1);
plot(x,'r');
title(' Señal Original');
ylabel('Amplitud'); 
xlabel('Muestras');
subplot(2,1,2);
plot(y,'b'); ylabel('Amplitud');  xlabel('Muestras');
title('Señal de audio con el efecto Flanger');

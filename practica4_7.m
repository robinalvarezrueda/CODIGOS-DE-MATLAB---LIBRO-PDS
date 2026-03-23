%% PRÁCTICA 4.7. Generación de ecos múltiples en una señal de audio.

clc, clear all, close all

[y,Fs]=audioread('HolaComoEstas.wav');
 y1=y(:,1);

%  Introducción de eco:
tiempo_retardo=input('Ingrese tiempo de retardo en segundos: ');
retardo=tiempo_retardo*Fs;

%Ingresa el número de ecos requeridos:
N_ecos=input('Ingrese número de ecos: ');

%Amplitud de la señal 
a=input('Ingrese factor de reducción de amplitud de la señal: (entre 0 y 1)');

% Se inicializa el vector como si fuera la onda de sonido original:
y_eco = y1';

%Lazo para añadir ecos
for i=1:N_ecos
    %Eco generado reducido en amplitud
    eco = a^i*[zeros(1,retardo*i) y1']; % Debe ir decreciendo respecto al eco anterior
    %Eco sumado a la señal
    y_eco = [y_eco  zeros(1,retardo)] + eco;
end

%Reproducción del eco 
sound(y_eco,Fs)

%Guardar archivo de audio:
audiowrite('ecos.wav',y,Fs);

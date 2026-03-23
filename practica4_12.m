%% PRÁCTICA 4.12. Efecto de bamboleo espacial a frecuencia controlada.

clc; clear all; close all,      
% EFECTO DE VARIACIÓN ESPACIAL:
% El audio PUEDE SER ESTEREO O MONOFÓNICO.
%Lectura del archivo de audio:
 [yn, Fs] = audioread('ArjonaOriginal.wav');
[filas,columnas]= size(yn);
% SI ES ESTERO, EXTRACCIÓN DE CANALES:
if columnas==2 
   yn1 = yn(:,1);
   yn2 = yn(:,2);
end
if columnas==1 
   yn1 = yn;
   yn2 = yn;
end
Ts = 1/ Fs;
% Se pasa a vector fila tal como estuvo el seno:
yn1 = yn1';
yn2 = yn2';
% Longitud del audio:
L_total = length (yn1);
% Vector de tiempos (en muestras):
tn_muestras = 1:1:L_total;
tn = (1:1:L_total)/Fs;
%% Construcción del vector 1:
% ONDA TRIANGULAR DE FRECUENCIA fo:
fo = 0.1; % 0.5 Hz
%vector_amplitudes_1 = 0.5*(sawtooth(2*pi*fo*tn,0.5)+1);
vector_amplitudes_1 = sin(2*pi*fo*tn);
%vector_amplitudes_2 = -0.5*(sawtooth(2*pi*fo*tn,0.5)+1);
vector_amplitudes_2 = cos(2*pi*fo*tn);
figure
hold on
plot(vector_amplitudes_1) % PERFECTO //
plot(vector_amplitudes_2) % PERFECTO //
title ('vectores de amplitud cambiando a 0.5 ciclos/seg')
%% AHORA SOLO QUEDA APLICAR ESTE VECTOR AL TONO:
yn_1_modificado = yn1.*vector_amplitudes_1;
yn_2_modificado = yn2.*vector_amplitudes_2;
figure
hold on
plot(yn_1_modificado)
plot(yn_2_modificado)
title ('Aumento y disminución de amplitud de amplitud a 0.5 ciclos/seg')
Y_2_canales = [yn_1_modificado' yn_2_modificado'];
sound(Y_2_canales,Fs)

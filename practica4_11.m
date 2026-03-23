%% PRÁCTICA 4.11. Desplazamiento espacial del sonido.

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
% Se pasa a vector fila:
yn1 = yn1';
yn2 = yn2';
% Longitud del audio:
L_total = length (yn1);
% Vector de tiempos (en muestras):
tn_muestras = 1:1:L_total;
%% Construcción del vector 1:
% Incremento lineal desde 0 hasta el final
vector_amplitudes_1 = zeros(1,L_total);
vector_amplitudes_2 = zeros(1,L_total);
%Ecuación de Recta 1: pendiente positiva
%y = x/L_total=tn_muestras/L_total
%Ecuación de Recta 2: pendiente negativa
%y = (-tn/(L_total))+1
% Recta 1:
for i = 1:L_total
    vector_amplitudes_1(i) = tn_muestras(i)/L_total;
end
% Recta 2:  
for i = 1:L_total
    vector_amplitudes_2(i) = (-1/(L_total))*(tn_muestras(i))+1;
end
figure, hold on
plot(vector_amplitudes_1) % PERFECTO //
plot(vector_amplitudes_2) % PERFECTO //
title('Comportamiento cruzado del vector de amplitudes de los dos canales')
%% AHORA SOLO QUEDA APLICAR ESTE VECTOR A LA SEÑAL DE AUDIO:
yn_1_modificado = yn1.*vector_amplitudes_1;
yn_2_modificado = yn2.*vector_amplitudes_2;
figure, hold on
plot(yn_1_modificado)
plot(yn_2_modificado)
title('Comportamiento cruzado de los dos canales')
Y_2_canales = [yn_1_modificado' yn_2_modificado'];
sound(Y_2_canales,Fs)

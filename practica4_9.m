%% PRÁCTICA 4.9. Crecimiento y decrecimiento LINEAL aplicado a un audio

clc; clear all; close all,      
%Lectura del archivo de audio:
[yn, Fs] = audioread('ArjonaOriginal.wav');
Ts = 1/ Fs;
% Se extrae un canal:
yn = yn(:,1);
% Se pasa a vector fila tal como estuvo el seno:
yn = yn';
% Se extrae la duración en segundos:
duracion = length (yn)/Fs;
% Se conforma la base de tiempo discreto:
tn = Ts:Ts:duracion;
tn_muestras = tn*Fs;
plot(tn, yn) 
title('Señal original')
xlabel('tn (segundos)')
%sound(yn,Fs)
% amplitudes entre +1 y -1
% Listo para aplicar reglas...
%% Construcción del vector 1:
% Incremento lineal desde 0 hasta 2 segundos: L1
% Decremento lineal los últimos 2 segundos: L2
% 0 ..... L1(2seg)..............L2(2 seg antes del fin)..... L_total
% CUIDADO!!! 
% PONER TODO EN MUESTRAS:
L_total = length (yn);
vector_amplitudes = zeros(1,L_total);
% L1 = (2 segundos)*Fs:
L1 = 2*Fs;
%L2 = (duracion - 2 segundos)*Fs:
L2 = (duracion-2)*Fs;
%Ecuación de Recta 1:
%y = x/L1=tn/L1
%Ecuación de Recta 2:
%y = (-1/(L_total-L2))*(tn-L2)+1
% Desde 0 hasta L1: multip. por Recta 1:
for i = 1:L1
    vector_amplitudes(i) = tn_muestras(i)/L1;
end
for i = L1+1:L2
    vector_amplitudes(i) = 1;
end
for i = L2+1:L_total
    vector_amplitudes(i) = (-1/(L_total-L2))*(tn_muestras(i)-L2)+1;
end
figure
plot(tn,vector_amplitudes) % PERFECTO //
title('Vector de amplitudes deseado')
xlabel('tn (segundos)')
%% AHORA SOLO QUEDA APLICAR ESTE VECTOR AL TONO:
yn_modificado = yn.*vector_amplitudes;
figure
plot(tn,yn_modificado)
title('Vector de amplitudes deseado x Señal original')
xlabel('tn (segundos)')
sound(yn_modificado,Fs)

%% PRÁCTICA 4.10. Crecimiento y decrecimiento NO LINEAL aplicado a un tono.

clc; clear all; close all,      
F1 = 1000;
duracion = 7;
Fmax = 2000; % para buena avisualización
Fs = 10*Fmax;
Ts = 1/ Fs;
tn = Ts:Ts:duracion;
tn_muestras = tn*Fs;
yn = sin (2*pi*F1*tn); %vector fila
plot(yn) 
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
% LONGITUD 1:
% L1 = (2 segundos)*Fs:
L1 = 2*Fs;
% LONGITUD 2: %L2 = (duracion - 2 segundos)*Fs:
L2 = (duracion-2)*Fs;
%Ecuación para INCREMENTO:
% Función logística 1: beta =1
beta = 4;
y1=2./(1+exp(-beta*tn))-1;
%Ecuación para DECREMENTO:
y1_invertida = fliplr(y1);
% Desde 0 hasta L1: multip. por Recta 1:
for i = 1:L1
    vector_amplitudes(i) = y1(i);
end
for i = L1+1:L2
    vector_amplitudes(i) = 1;
end
for i = L2+1:L_total
    vector_amplitudes(i) = y1_invertida(i);
end
figure
plot(tn,vector_amplitudes) % PERFECTO //
title('Conformación del vector de amplitudes')
xlabel('tn (segundos)')
%% AHORA SOLO QUEDA APLICAR ESTE VECTOR AL TONO:
yn_modificado = yn.*vector_amplitudes;
figure
plot(tn,yn_modificado)
title('Vector de amplitudes aplicado a la señal de audio'), xlabel('tn (segundos)')
sound(yn_modificado,Fs)

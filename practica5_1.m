%% PRÁCTICA 5.1. Suma de señales de audio con igual frecuencia de muestreo.

clc, close all, clear all
% Suma de dos sonidos que tienen la misma Fs:
[y1,fs1]=audioread('lobo.wav'); %Fs1 = 44100 Hz       
[y2,fs2]=audioread('ovni.wav'); %Fs2 = 44100 Hz       
% EXTRACCIÓN DE UN SOLO CANAL EN EL CASO DE QUE SEA ESTÉREO:
[filas1, columnas1]= size(y1);
[filas2, columnas2]= size(y2);
% SI SON ESTERIOFÓNICOS: extraer un solo canal
if columnas1==2 
   y1_1 = y1(:,1);
end
% SI SON MONOFÓNICOS: no hace falta extraer un solo canal
if columnas1==1 
   y1_1 = y1;
end
% Lo mismo para el otro audio:
if columnas2==2 
   y2_1 = y2(:,1);
end
if columnas2==1 
   y2_1 = y2;
end
y1_canal1=y1_1;          
y2_canal1=y2_1;   
subplot(2,1,1)
plot(y1_canal1)
title('Señal de audio 1')
subplot(2,1,2)
plot(y2_canal1,'g')
title('Señal de audio 2')
% Si ambas Fs son iguales, entonces se prosigue con el llenado de ceros
% de la señal más corta y se suman las dos señales:
if fs1==fs2
    if length(y1_canal1)<length(y2_canal1)
        y1_canal1_ceros=[y1_canal1;zeros(length(y2_canal1)-length(y1_canal1),1)];
        y_suma=y1_canal1_ceros+y2_canal1;
        figure
        subplot(3,1,1)
        plot(y1_canal1_ceros)
        title('Señal de audio 1')
        subplot(3,1,2)
        plot(y2_canal1,'g')
        title('Señal de audio 2')
        subplot(3,1,3)
        plot(y_suma,'k'), title('Suma de dos audios que tienen la misma Fs')
    else y2_canal1_ceros=[y2_canal1;zeros(length(y1_canal1)-length(y2_canal1),1)];
        y_suma=y1_canal1+y2_canal1_ceros;
        figure
        subplot(3,1,1)
        plot(y1_canal1), title('Señal de audio 1')
        subplot(3,1,2)
        plot(y2_canal1_ceros,'g'), title('Señal de audio 2')
        subplot(3,1,3)
        plot(y_suma,'k'), title('Suma de dos audios que tienen la misma Fs')
    end
end
sound(y_suma, fs1)

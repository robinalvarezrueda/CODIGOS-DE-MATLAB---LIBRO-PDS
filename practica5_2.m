%% PRÁCTICA 5.2. Análisis del problema de suma de señales con distintas frecuencias de muestreo.

clc, close all, clear all
% Suma de dos sonidos que tienen distinta Fs:
[y1,Fs1]=audioread('pajaros.wav'); % Fs1 = 11025 Hz      
[y2,Fs2]=audioread('ovni.wav');      % Fs2 = 44100 Hz
% EXTRACCIÓN DE UN SOLO CANAL EN EL CASO DE QUE SEA ESTEREOFONICO:
[filas1, columnas1]= size(y1);
[filas2, columnas2]= size(y2);
if columnas1==2 
   y1_1 = y1(:,1);
end
% EXTRACCIÓN DE UN SOLO CANAL EN EL CASO DE QUE SEA MONOFONOFICO:
if columnas1==1 
   y1_1 = y1;
end
if columnas2==2 
   y2_1 = y2(:,1);
end
if columnas2==1 
   y2_1 = y2;
end
y1_canal1=y1_1';          
y2_canal1=y2_1';         
%  Se crean las bases de tiempos para ambas ondas
Ts1=1/Fs1;
tn1 = Ts1:Ts1:length(y1_canal1)/Fs1;
Ts2=1/Fs2;
tn2 = Ts2:Ts2:length(y2_canal1)/Fs2;
subplot(2,1,1)
stem(tn1,y1_canal1,'b'), xlim([0.5 0.5005])
title('pajaros: Fs= 11025 muestras/seg') 
subplot(2,1,2)
stem(tn2,y2_canal1,'r')
xlim([0.5 0.5005]), title('ovni: Fs = 44100 muestras/seg')

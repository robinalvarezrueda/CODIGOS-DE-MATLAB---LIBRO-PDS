%% PRÁCTICA 2.11. Análisis tiempo–frecuencia de señales secuenciales

%Generador secuencial:
clc; clear; close all;
w=1;
while w<=4; % generación de 4 veces
%% Onda 1: sinusoide (1 KHz), duración=0.5(seg):
duracion1=0.5; 
Fo1=1000; 
T=1/Fo1; Ts1=T/100; 
tn1=0:Ts1:duracion1; 
y1 = sin(2*pi*Fo1*tn1);
Fs1 = 1/Ts1;  
sound (y1,Fs1), pause(duracion1)
%% Onda 2: sinusoide (2 KHz), duración=0.7(seg):
duracion2=0.7; 
Fo2=2000;
T=1/Fo2;  Ts2=T/100;  
tn2=0:Ts2:duracion2; 
y2 = sin(2*pi*Fo2*tn2);
Fs2=1/Ts2; 
sound (y2, Fs2), pause(duracion2)
%% Onda 4: sinusoide (3 KHz), duración=0.5(seg):
duracion3=0.5; 
Fo3=3000;
T=1/Fo3;  Ts3=T/65;  
tn3=0:Ts3:duracion3; 
y3 = sin(2*pi*Fo3*tn3);
Fs3=1/Ts3; 
sound (y3, Fs3), pause(duracion3)
w=w+1;
end

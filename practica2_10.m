%% PRÁCTICA 2.10. Implementación de un generador secuencial de señales

%Generador secuencial:
clc; clear; close all;
w=1;
while w==1; % generación indefinida
%% Onda 1: sinusoide rectificada de medio período (1 KHz), duración=3(seg):
duracion1=3; 
Fo1=1000; 
T=1/Fo1;
Ts1=T/100; 
tn1=0:Ts1:duracion1; 
y1 = sin(2*pi*Fo1*tn1);
y1_1 = y1;
j=1;
for i=tn1
  if y1(j)<0;
     y1_1(j)=0;
  end
  j=j+1;
end
Fs1 = 1/Ts1;  
sound (y1_1,Fs1), pause(duracion1)
%% Onda 2: onda cuadrada de 2 (KHz), duración=2(seg):
duracion2=2; 
Fo2=2000;
T=1/Fo2;  
Ts2=T/100;  
tn2=0:Ts2:duracion2; 
y2=square(2*pi*Fo2*tn2,50);
Fs2=1/Ts2; 
sound (y2, Fs2), pause(duracion2)
%% Onda 3: onda diente de sierra de 1.5(KHz), duración= 4(seg):
duracion3=4; 
Fo3=1500;
T=1/Fo3;  
Ts3=T/100;  
tn3=0:Ts3:duracion3; 
y3=sawtooth(2*pi*2*Fo3*tn3,1);
Fs3=1/Ts3; 
sound (y3, Fs3), pause(duracion3)
end

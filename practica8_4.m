%% PRÁCTICA 8.4. Implementación manual de una señal chirp y validación espectral

clc, clear all, close all
duracion = 10;
fo = 1000;
f1 = 2000; 
Fmax=f1;
Fs = 10*Fmax;
Ts = 1/Fs;
tn = Ts:Ts:duracion;
p=1; % p es el orden del polinomio (p=1: lineal)(p=2: cuadrático)
beta   = (f1-fo)./(duracion.^(p));
fi=fo+beta*tn; %+ para incremento de la frecuencia instantanea
y = cos(2*pi*fi.*tn);% operador(.) importante para que no dé error.
plot(tn,y);
title('CHIRP: desde 1KHz hasta 2 KHz en 10 segundos');
xlabel('tiempo [s]');
ylabel('Amplitud');
grid minor;
sound(y,Fs)

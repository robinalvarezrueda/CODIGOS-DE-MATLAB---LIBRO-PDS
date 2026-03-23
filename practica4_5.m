%% PRÁCTICA 4.5. Inversión vertical de una señal de audio.

clc,close all,clear all
[y,Fs,Nb]=wavread(hola.wav');
y1=y(:,1);
y_inv_vertical=(-1)*y1;
plot(y1,'b')
hold on
plot(y_inv_vertical,'r')
legend('Senal invertida')
sound(y_inv_vertical,Fs)

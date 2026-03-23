%% PRÁCTICA 5.9. Interpretación gráfica y física de la autocorrelación

clc, close all, clear all;
%Señal cuadrada de 100 Hz:
duracion=1;
Fo= 100;
Fmax= 50*Fo; %por los armónicos 
Fs= 10*Fmax;
Ts=1/Fs;
tn= 0:Ts:duracion;
yn= square(2*pi*Fo*tn);
%% Señal cuadrada de 100 Hz y su Autocorrelación:
Autocor_yn= xcorr(yn);%con el máximo de 1 
subplot(3,2,1);
plot(yn); title('Señal Cuadrada');
subplot(3,2,2);
plot(Autocor_yn); title('Autocorrelación de la Señal Cuadrada');
%% Ruido AWGN y su autocorrelación:
ruido= randn(1, length(yn));
Autocor_ruido=xcorr(ruido);
subplot(3,2,3)
plot(ruido); title('Ruido');
subplot(3,2,4);
plot(Autocor_ruido); title('Autocorrelacionada del Ruido');
%% (Señal cuadrada + Ruido AWGN) y su autocorrelación:
ysum= yn+ruido;
Autocor_ysum=xcorr(ysum);
subplot(3,2,5)
plot(ysum); title('Señal Cuadrada + Ruido');
subplot(3,2,6)
plot(Autocor_ysum); title('Autocorrelacionada de la Señal Cuadrada + Ruido');

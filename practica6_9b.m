%% PRÁCTICA 6.9b. Transformada Discreta de Fourier de una onda diente de sierra

clc;clear all;close all;  
%xn: vector que contiene muestras de un período de la señal 
xn=[0 1 2 3];
Xk = dft_for(xn); % llama a la función dft_for que calcula los N complejos
disp('Coeficientes de Fourier Ck:'), Xk'

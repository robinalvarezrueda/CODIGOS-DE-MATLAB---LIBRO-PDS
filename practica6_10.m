%% PRÁCTICA 6.10. Implementación vectorial eficiente de la DFT

clc;clear all;close all;
% xn: vector que contiene muestras de un período de la señal periódica – DEBE SER VECTOR FILA
xn=[0 1 2 3];
Xk = dft_vectorial(xn);
disp('Coeficientes de Fourier Ck:')
Xk'

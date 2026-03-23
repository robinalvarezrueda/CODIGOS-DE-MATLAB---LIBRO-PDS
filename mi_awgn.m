%% PRÁCTICA 10.3. Implementación de un generador propio de ruido AWGN y validación estadística 

function [y_noisy] = mi_awgn(x, SNR)
%my_awgn agrega ruido a una señal x
% y devuelve tambien el vector de ruido 'noise'
% El SNR se ingresa en dB
N = length(x); % Tamaño de la señal
P_x = sum(abs(x.^2))/N; % potencia promedio de la señal (Parseval)
SNR_lineal = 10^(SNR/10); % Se pasa el SNR a escala lineal
No = P_x/SNR_lineal; % Densidad espectral del ruido
% Considerando la señal real x:
sigma_ruido = sqrt(No); % Desviacion estandar del ruido AWGN
noise = sigma_ruido*randn(1,N); % calculo del ruido
% A la señal original se le agrega el ruido calculado
y_noisy = x + noise;
end

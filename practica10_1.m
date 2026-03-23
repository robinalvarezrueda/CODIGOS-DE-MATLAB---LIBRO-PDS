%% PRÁCTICA 10.1. Generación y caracterización estadística del ruido gaussiano blanco 

clc, clear all, close all
y = randn(1,1000); % vector de 1000 muestras
stem(y)
title('Señal discreta con una FDP gaussiana')
figure
histfit(y,100) % permite hallar el histograma y superponer el mejor ajuste gaussiano
title('Histograma de señal discreta con una FDP gaussiana')
%% Mediciones para realizar VERIFICACIÓN:
% Tendencia central (media aritmética o promedio):
promedio=mean(y);
% Dispersión (desviación estándar):
desv_est=std(y);
% Asimetría (skweness):
asimetria=skewness(y);
% Peso en colas (kurtosis):
peso_colas=kurtosis(y);

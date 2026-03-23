%% PRÁCTICA 14.12(b): VERIFICACIÓN DE FUNCIONAMIENTO DE LA MLP YA ENTRENADA - CLASIFICACIÓN DE ENTRADAS NUEVAS

clc, close all, clear all
load pesos_W1_W2
% Algunas letras con fallas para probar la red entrenada (COMO VECTORES COLUMNA):
Ac=[0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
Hc=[1 0 0 0 1 0 0 0 0 1 1 0 0 0 1 1 1 0 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
Cc=[1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 0 0 1]';
Sc=[0 1 0 1 0 1 0 0 0 1 1 0 0 0 0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 1 1 1 1 1 1]';
Tc=[1 1 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 1 0 1 0 0]';
abc_prueba=[Ac Hc Cc Sc Tc]; %Matriz con las letras de 
 
% SALIDAS DE LAS 5 NEURONAS DE LA CAPA DE SALIDA:
output_1 = logistic(W2*[1;logistic(W1*[1;abc_prueba(:,1)])])'
output_2 = logistic(W2*[1;logistic(W1*[1;abc_prueba(:,2)])])'
output_3 = logistic(W2*[1;logistic(W1*[1;abc_prueba(:,3)])])'
output_4 = logistic(W2*[1;logistic(W1*[1;abc_prueba(:,4)])])'
output_5 = logistic(W2*[1;logistic(W1*[1;abc_prueba(:,5)])])'

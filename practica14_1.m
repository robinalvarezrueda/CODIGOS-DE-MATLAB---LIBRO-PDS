%% Práctica 14.1. Evaluación de funciones de activación

clc,close all, clear all
x=[-5:0.1:5]; % Intervalo de evaluación
%Función lineal:
y1=lineal(x);
subplot(2,2,1)
plot(x,y1)
title('Función de activación lineal')
xlabel('x'); ylabel('Lineal(x)'), grid minor
%Función logística o sigmoidal:
y2=logistic(x);
subplot(2,2,2)
plot(x,y2)
title('Función de activación logística o sigmoidal')
xlabel('x'); ylabel('Logistica(x)'), grid minor
%Función tangente hiperbólica (propia de Matlab):
y3=tanh(x);
subplot(2,2,3)
plot(x,y3)
title('Función de activación tangente hiperbólica')
xlabel('x'); ylabel('Tanh(x)'), grid minor
%Función paso:
y4=paso(x);
subplot(2,2,4)
plot(x,y4);
title('Función de activación Paso'), xlabel('x'); ylabel('Paso(x)'), grid minor

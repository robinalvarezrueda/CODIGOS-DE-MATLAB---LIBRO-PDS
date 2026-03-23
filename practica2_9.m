%% PRÁCTICA 2.9. Uso independiente de los dos canales de salida de audio.

%% Programa para manejar los 2 canales de salida del puerto de audio de manera independiente
clc,close all,clear all
Amax=1;%Amplitud de las señales
F1=500; %Frecuencia 1
F2=1000; %Frecuencia 2
% Tiempo entre muestras considerando la Frecuencia más exigente (F2):
T = 1/F2;
duracion= 4*T; %Duracion en segundos
Ts= T/ 100; % Considerando 100 muestras por cada período.
tn1=[0:Ts:duracion]; %Vector de tiempo discreto
%Generación de señales sinusoides de diferente frecuencia
%Se multiplica 0.75, para que la señal no sobrepase la amplitud de +/-1 voltio.
yn1=Amax*sin(2*pi*F1*tn1);
yn2=Amax*sin(2*pi*F2*tn1);
%verificación visual:
plot(tn1,yn1,tn1,yn2);
legend('Canal izquierdo: sinusoide de 500 Hz ','Canal derecho: sinusoide de 1000 Hz')
title('Generación de dos ondas distintas de manera simultánea')
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on 
%Crear la matriz: Columna 1 corresponde al canal 1 y Columna 2 corresponde al canal 2
yn=[yn1' yn2'];
%Verificación auditiva:
% Fs = 1/ Ts;
% sound(yn,Fs)

%% PRÁCTICA 4.3. Atenuación y amplificación de señales de audio

clc; clear all; close all,      
[y,Fs] = audioread('hola.wav');
y1 = y(:,1);                   
atenuada = 0.5*y1;  %atenuar al 50%
amplificada = 2*y1; %amplificado al 200%
hold on
plot(y1,'k')
plot(atenuada,'b')
plot(amplificada, 'r')
legend ('original', 'atenuada', 'amplificada')
sound(y1,Fs);                  % Se escucha y1 canal mono 
pause;                             % Enter en el Command Windows para continuar
sound(atenuada,Fs);       % Se escucha señal atenuada
pause;                             % Enter en el Command Windows para continuar
sound(amplificada,Fs);   % Se escucha la señal amplificada

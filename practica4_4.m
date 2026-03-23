%% PRÁCTICA 4.4. Inversión temporal de una señal de audio (reversa).

clc; clear all; close all,      
[y,Fs] = audioread('hola.wav');
y1 = y(:,1);                   
y1_invertida_horizontal = y1(end:-1:1);
hold on
plot(y1,'k')
plot(y1_invertida_horizontal,'b')
legend ('original', 'invertida horizontal')
sound(y1,Fs);    % Se escucha y1 original 
pause;               % Enter en el Command Windows para continuar
sound(y1_invertida_horizontal,Fs); % Se escucha y1 en reversa

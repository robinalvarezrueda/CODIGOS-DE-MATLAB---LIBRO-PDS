%% PRÁCTICA 6.4b. Serie de Fourier de una onda diente de sierra.

clc, close all, clear all
A=1; % Amplitud
t = 0:.02:2*pi;
% Se supone los aportes de la fundamental y de cada uno de los armónicos:
hold  on % superposición activada
% Frecuencia fundamental de la señal cuadrada (AZUL)
y1=(-A/pi)*sin(t);
plot(t,y1,'b')
xlabel('t')
ylabel('y')
% Primer armónico impar (VERDE):
y2=(-A/(2*pi))*sin(2*t);
plot(t,y2,'g')
% Segundo armónico impar (ROJO):
y3=(-A/(3*pi))*sin(3*t);
plot(t,y3,'r')
% Tercer armónico impar (NEGRO):
y4=(-A/(4*pi))*sin(4*t);
plot(t,y4,'k')
% SUMA RESULTANTE de los aportes anteriores (ROJO GRUESO):
y_suma= y1+y2+y3+y4;	
plot(t,y_suma,'r','linewidth',3)
title('Conformación de la onda diente de sierra con 4 componentes')

% clc, close all, clear all
% A=1; % Amplitud
% t = 0:.01:4*pi;
% x = zeros(size(t));
% % Número de armónicos que se desea considerar:
% n = 10;
% % Onda resultante de la suma de los n armónicos:
% for k = 1:1:n 
%     %función que describe la sumatoria de ondas:
%     x = x + (-2*A/pi)*(sin(k*t)/k);
% end
% plot(t, x, 'LineWidth', 1.5);
% title(['Onda diente de sierra con n = ', num2str(n), ' armónicos']);
% xlabel('tiempo [s]');
% ylabel('Amplitud [V]');
% grid on;
% 

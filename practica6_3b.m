%% PRÁCTICA 6.3b. Serie de Fourier de una onda cuadrada.
clc, close all, clear all
A=1; % Amplitud
t = 0:.02:2*pi;
% Se consideran los aportes de la fundamental y de 3 armónicos:
hold  on % superposición activada
% Frecuencia fundamental de la señal cuadrada (AZUL)
y1=(4*A/pi)*sin(t);
plot(t,y1,'b'), xlabel('Tiempo'), ylabel('Amplitud')
% Primer armónico impar (VERDE):
y2=(4*A/(3*pi))*sin(3*t);
plot(t,y2,'g')
% Segundo armónico impar (ROJO):
y3=(4*A/(5*pi))*sin(5*t);
plot(t,y3,'r')
% Tercer armónico impar (NEGRO):
y4=(4*A/(7*pi))*sin(7*t);
plot(t,y4,'k')
% SUMA RESULTANTE de los aportes anteriores (ROJO GRUESO):
y_suma= y1+y2+y3+y4;
plot(t,y_suma,'r','linewidth',3)


%% para n componentes:

% clc, close all, clear all
% Ymax=1; % Amplitud
% t = 0:.02:2*pi;
% x = zeros(size(t));
% % Número de armónicos que se desea considerar:
% n = 20;
% % Onda resultante de la suma de los n armónicos:
% for k = 1:2:n 
%     % función que describe la sumatoria de ondas:
%     x = x + (4*Ymax/pi)*(sin(k*t)/k);
% end
% plot(x), title('Onda resultante de la suma de n componentes')

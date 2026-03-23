%% PRÁCTICA 6.5b. Serie de Fourier de una onda triangular

clc, close all, clear all
A=1; % Amplitud
t = 0:.02:4*pi;
% Se van a superponer los aportes de la fundamental y de cada uno de los armónicos:
hold  on % superposición activada
% Frecuencia fundamental de la señal triangular (AZUL)
y1=(8*A/(pi^2))*cos(t);
plot(t,y1,'b')
xlabel('Tiempo')
ylabel('Amplitud')
% Primer armónico impar (VERDE):
y2=(8*A/(9*pi^2))*cos(3*t);
plot(t,y2,'g')
% Segundo armónico impar (ROJO):
y3=(8*A/(25*pi^2))*cos(5*t);
plot(t,y3,'r')
% Tercer armónico impar (NEGRO):
y4=(8*A/(49*pi^2))*cos(7*t);
plot(t,y4,'k')
% SUMA RESULTANTE de los aportes anteriores (ROJO GRUESO):
y_suma= y1+y2+y3+y4;
plot(t,y_suma,'r','linewidth',3)

% 
% clc, close all, clear all
% A=1; % Amplitud
% t = 0:.02:4*pi;
% x = zeros(size(t));
% % Número de armónicos que se desea considerar:
% n = 10;
% % Onda resultante de la suma de los n armónicos impares:
% for k = 1:2:n 
% %función que describe la sumatoria de ondas:
%     x = x + (8*A/(pi^2*k^2))*(cos(k*t));
% end
% plot(x), xlabel ('Tiempo'), ylabel ('Amplitud'), title('Onda resultante de la suma de los n aportes')

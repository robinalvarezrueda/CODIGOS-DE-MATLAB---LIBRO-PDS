%% Práctica 14.2. Cálculo de la salida de una neurona artificial.

%Esquema 1:
x = [1 7 9]'; % Entradas como vector columna
w = [0.65 0.23 -0.14]; % Pesos como vector fila
b = - 0.4;
y = tanh(w*x+b) % Salida de la neurona:

% %Esquema 2:
% x = [1 1 7 9]';
% b = -0.4;
% w = [b 0.65 0.23 -0.14];
% % salida de la neurona:
% y = tanh(w*x) 

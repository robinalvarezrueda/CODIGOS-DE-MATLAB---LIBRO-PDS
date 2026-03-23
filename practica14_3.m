%% Práctica 14.3. Salida de una capa con dos neuronas.

% Forma 1:
x=[6.8 14 2]'; % Entradas como vector columna
w=[ 0.1 0.2 -0.17; 0.5 -0.36 -0.45 ]; % Pesos matriz de vectores fila
b=[1.3 -0.8]';
y=tanh(w*x+b) 

% % Forma 2:
% x=[ 1 6.8 14 2]';  
% w=[1.3 0.1 0.2 -0.17; -0.8 0.5 -0.36 -0.45];
% y=tanh(w*x)  

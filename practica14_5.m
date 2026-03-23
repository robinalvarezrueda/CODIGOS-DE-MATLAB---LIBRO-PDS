%% PRÁCTICA 14.5. Entrenamiento de una neurona con la regla de Hebb

clc, close all, clear all

x = [-0.8 7]';        %Entradas X1=-0.8 y X2=7
b = [0.1];            %bias
w = [0.5  -0.67];     %Pesos W1=0.5 y W2=-0.67
t = [1];              %Salida deseada
y=paso(w*x+b)         %Función de activación paso unitario: % y =   0 

%% Algoritmo de Aprendizaje de Hebb:
if y==t   % No hay cambio w=w; b=b;
elseif  y==0    % Pues Target = 1
    w = w+x'
    b = b+1
else            % y==1   Pues target=0.
   w = w-x'
    b = b-1
end
% Grados de libertad actualizados:  w =    -0.3000   6.3300,  b =    1.1000
% Salida actualizada:	
y=paso(w*x+b)  % y =     1  % ya convergió 

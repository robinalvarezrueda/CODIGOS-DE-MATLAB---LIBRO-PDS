%% PRÁCTICA 14.6. Entrenamiento supervisado de un perceptrón

x = [0 1; 1 -1]
t=[0 1];
w=[-0.1 0.8]; b=[-.5];
y=paso(w*x+b)  
 
% Se debe actualizar los grados de libertad para que la red obtenga lo que se desea
% Hay que hacer Hebb para cada salida y(i):
[entradas,patrones]=size(x);
 
% Repetir el lazo tantas veces como puntos:
for i=1: patrones
   if y(i)==t(i)    % Ya converge: w=w; b=b; 
 
   elseif  y(i)==0   % Target = 1
     w = w+x(:,i)'
     b = b+1
   else   % y=1 target=0. 
     w = w-x(:,i)'
     b = b-1
  end
end
 y=paso(w*x+b)

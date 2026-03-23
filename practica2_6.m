%% PRÁCTICA 2.6. Generación de una sinusoide rectificada completa truncada.

clc, clear all, close all 
Amax=1;
Fo=500; 
T=1/Fo; 
duracion=2*T; 
Ts=T/100;  
tn=0:Ts:duracion;  % vector de tiempo discreto   
y= Amax*sin(2*pi*Fo*tn); % Vector de amplitudes: 
% La onda rectificada completa es obtenida al invertir los semiciclos negativos por medio del comando abs: 
y_abs=abs(y);   
y1=y_abs; % Vector auxiliar
% Se encuentra las posiciones de los valores mayores a 0.7 y mediante un lazo for, se cambia por 0.7
j=1;
for i=tn
  if y1(j)>0.7;
     y1(j)=0.7;
  end
  j=j+1;
end
% Verificación visual: 
stem(tn,y1) % Verificación grafica. 
grid on 
xlabel('Tiempo(seg)'); 
ylabel('Amplitud') 
title('Onda Rectificada Completa Truncada') % Titulo del Gráfico 
% Verificación auditiva: 
%Fs = 1/Ts;
%sound (y1, Fs)

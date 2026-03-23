%% PRÁCTICA 2.7. Generación de una sinusoide rectificada de medio período.

clc, clear all, close all 
Amax = 0.5;
Fo=1000; 
T=1/Fo; 
duracion=2*T; 
% tiempo entre muestras (se consideran 100 muestras/período) 
Ts=T/100;  
tn=0:Ts:duracion;  %inicio:salto:fin   
% Vector de amplitudes: 
y1=Amax*sin(2*pi*Fo*tn); 
% Un rectificador de media onda puede ser obtenido reemplazando 
% la parte negativa de una señal sinusoidal con ceros:
y2 = y1;
j=1;
for i=tn
  if y1(j)<0;
     y2(j)=0;
  end
  j=j+1;
end
stem(tn,y2);
xlabel('Tiempo(seg)') % Titulo del Eje X
ylabel('Amplitud') % Titulo del Eje Y
title('Onda Rectificada de Media Onda') % Titulo del Gráfico
% Verificación auditiva: 
%Fs = 1/Ts;
%sound (y2, Fs)

%% PRÁCTICA 5.6b.  Comparación de métodos de interpolación en señales temporales.

clc, clear all, close all
%Datos experimentales:
% x = 0:pi/4:2*pi; 
% y = sin(x);
% % Nuevos puntos a interpolar:
% xq = 0:pi/16:2*pi;
% % Puntos de la señal real:
% xn = 0:pi/32:2*pi; 
% y_real = sin(xn);
%Datos experimentales:
x = 0:pi/4:2*pi; 
y = sin(x)+2*cos(x);
% Nuevos puntos a interpolar:
xq = 0:pi/16:2*pi;
% Puntos de la señal real:
xn = 0:pi/32:2*pi; 
y_real = sin(xn)+2*cos(xn);

%% TÉCNICAS DE INTERPOLACIÓN:
Interp_lineal = interp1(x,y,xq); % Interpolación lineal por defecto
Interp_spline = interp1(x,y,xq,'spline'); % Interpolación mediante spline
Interp_pchip = interp1(x,y,xq,'pchip'); % Interpolación mediante pchip 
Interp_cubic = interp1(x,y,xq,'cubic'); % Interpolación mediante cubic
Interp_makima = interp1(x,y,xq,'makima'); % Interpolación mediante makima

subplot(2,2,1)
plot(x,y,'o',xq,Interp_lineal,'*',xn,y_real,'+');
legend('Datos originales','Puntos interpolados','Señal real');
title('Interpolación lineal (por defecto)');

subplot(2,2,2)
plot(x,y,'o',xq,Interp_spline,'*',xn,y_real,'+'); 
legend('Datos originales','Puntos interpolados','Señal real');
title('Interpolación mediante Spline');

subplot(2,2,3)
plot(x,y,'o',xq,Interp_pchip,'*',xn,y_real,'+'); 
legend('Datos originales','Puntos interpolados','Señal real');
title('Interpolación mediante Pchip');

subplot(2,2,4)
plot(x,y,'o',xq,Interp_makima,'*',xn,y_real,'+'); 
legend('Datos originales','Puntos interpolados','Señal real');
title('Interpolación mediante makima');
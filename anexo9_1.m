%% ANEXO 9.1 Código para obtener un coseno truncado

clc, clear all, close all
f1=100;
duracion=0.1;
Fmax = f1;
Fs=10*Fmax; 
Ts=1/Fs;
% base de tiempos (discreto)
n=0:Ts:duracion;
% vector de amplitudes
x1=sin(2*pi*f1*n); % simula la señal "infinita"
% Ventana rectangular:
x2=zeros(1,length(x1));
x2(30:80)=1;
% Grafica (dominio del tiempo)
subplot(3,1,1)
plot(n,x1)
grid on; grid minor
title('Gráfica dominio del tiempo'); xlabel('t[s]'); ylabel('Amplitud')
subplot(3,1,2)
plot(x2), grid on; grid minor
title('Ventana rectangular');
subplot(3,1,3)
x3=x1.*x2;
plot(n,x3)
grid on; grid minor, title('Gráfica dominio del tiempo'); xlabel('t[s]'); ylabel('Amplitud')

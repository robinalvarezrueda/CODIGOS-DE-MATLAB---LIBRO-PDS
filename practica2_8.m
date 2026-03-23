%% PRÁCTICA 2.8. Generación de una onda híbrida sinusoidal–triangular.

clc, close all, clear all
Fo=1000;
T=1/Fo;
duracion=3*T;
Ts=T/100; % tiempo entre muestras
tn=0:Ts:duracion;  %inicio:salto:fin
y1=1*sin(2*pi*Fo*tn);
y2=0.5*sawtooth(2*pi*Fo*tn,0.5)+0.5;
subplot(3,1,1)
plot(tn,y1,'b')
hold on
plot(tn,y2, 'r')
title('Ondas sinusoidal original y triangular solo positiva')
grid minor

% Para encuadrar la triangular de modo que se ubique según lo deseado: hay que
% aumentar al doble de frecuencia:
y2_2f=0.5*sawtooth(2*pi*2*Fo*tn,0.5)+0.5;
subplot(3,1,2)
plot(tn,y1, 'b')
hold on
plot(tn,y2_2f, 'r')
title('Ondas sinusoidal original y triangular solo positiva con 2Fo')
grid minor

% Ahora, si la sinusoidal es negativa, hay que sustituirla por la triangular:
y_final = y1;
for n=1:length(tn)
    if y1(n)<=0
        y_final(n)=y2_2f(n);
    end
end
y_final=0.5*y_final;
subplot(3,1,3)
plot(tn,y_final, 'r')
title('Onda mixta solicitada de Fo = 1 (KHz)')
xlabel('t(sec)')
grid minor

% Verificación auditiva: 
%Fs = 1/Ts;
%sound (y2_2, Fs)

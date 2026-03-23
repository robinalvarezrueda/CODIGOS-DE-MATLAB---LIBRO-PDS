%% PRÁCTICA 3.5. Reconstrucción de una señal a partir de muestras discretas.

clc, close all, clear all
tn = -10:0.1:10;
y1 = sinc(tn);
y2 = sinc(tn-0.3);
y3 = sinc(tn-0.5);
y4 = sinc(tn-0.7);
y5 = sinc(tn-0.9);
tiempos = [0 0.3 0.5 0.7 0.9];
muestras = [0.1 -0.2 0.3 -0.4 0.5];
subplot(2,2,1)
stem(tiempos, muestras,'LineStyle',':','Marker','o','LineWidth',1.0)
grid minor
xlim([-1 5])
title('Muestras tomadas')
subplot(2,2,2)
plot(tn,y1,tn,y2,tn,y3,tn,y4,tn,y5,'LineWidth',1.5)
grid minor
xlim([-1 5])
title('SINCs desplazadas hacia la zona de su respectiva muestra')
legend('sinc(t)','sinc(t-0.3)','sinc(t-0.5)','sinc(t-0.7)','sinc(t-0.9)')
%% b) Multiplicación de cada una de las Sincs desplazadas por su valor respectivo de muestra:
y1 = y1*0.1;
y2 = y2*(-0.2);
y3 = y3*0.3;
y4 = y4*(-0.4);
y5 = y5*0.5;
subplot(2,2,3)
plot(tn,y1,tn,y2,tn,y3,tn,y4,tn,y5,'LineWidth',1.5)
grid minor
xlim([-1 5])
title('Muestras x sinc')
legend('sinc(t)*x[0]','sinc(t-0.3) *x[1]','sinc(t-0.5) *x[2]','sinc(t-0.7) *x[2]','sinc(t-0.9) *x[3]')
%% c) Suma de todos los aportes del numeral anterior para obtener la señal recuperada:
Y_recuperada = y1+y2+y3+y4+y5;
subplot(2,2,4)
plot(tn, Y_recuperada,'LineWidth',2,'Color','red');
grid minor
xlim([-1 5])
title('Señal reconstruida')

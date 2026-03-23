%% PRÁCTICA 13.1. Generación de señales definidas a trozos y diagrama tiempo-frecuencia ideal

clc, close all, clear all
%% 1.- Recepción de datos de las componentes:
% Frecuencias de las componentes (ordenadas de menor a mayor):
f1=100; f2=200; 
% Amplitudes:
a1=1; a2=1;  
% Duraciones de las componentes - FENÓMENO 1:
t11=[0 1]; t12=[1 2]; 
% Duraciones de las componentes - FENÓMENO 2:
t21=[1 2]; t22=[0 1]; 
%% 2.- Generación del diagrama tiempo-frecuencia ideal:
figure(1)
subplot(3,2,1)
hold on
plot (t11,[f1 f1],'linewidth',2)
plot (t12,[f2 f2],'linewidth',2)
title('DIAGRAMA TIEMPO-FRECUENCIA IDEAL - FENÓMENO 1')
xlabel('t(sec)'), ylabel('F(Hz)'),axis([0 2 0 300])
legend('Amp.1: 1','Amp.2: 1'), grid minor
subplot(3,2,2)
hold on
plot (t21,[f1 f1],'linewidth',2)
plot (t22,[f2 f2],'linewidth',2)
title('DIAGRAMA TIEMPO-FRECUENCIA IDEAL - FENÓMENO 2')
xlabel('t(sec)'), ylabel('F(Hz)')
axis([0 2 0 300])
legend('Amp.1: 1','Amp.2: 1')
grid minor
%% 3. Generación de las señales compuestas
% MÉTODO: aquí se aprovecha las ventajas de programación de Matlab,
Fs=10*f2; % Fs respecto de la f5 que es la más exigente 
Ts=1/Fs;
duracion = 2; % es el tiempo máximo que ocupan las componentes
t=0:Ts:duracion;
% FENÓMENO 1. Se definen las componentes en todo el rango:
comp1=a1*sin(2*pi*f1*t);
comp2=a2*sin(2*pi*f2*t);
% se enceran las zonas en donde no existen las señales:
comp1=((t>=0)&(t<=1)).*(comp1);
comp2=((t>=1)&(t<=2)).*(comp2);
% La señal compuesta es la suma de todas las componentes:
yt1 = comp1+comp2;
% FENÓMENO 2. Se definen las componentes en todo el rango:
comp1=a1*sin(2*pi*f1*t);
comp2=a2*sin(2*pi*f2*t);
% se enceran las zonas en donde no existen las señales:
comp1=((t>=1)&(t<=2)).*(comp1);
comp2=((t>=0)&(t<=1)).*(comp2);
% La señal compuesta es la suma de todas las componentes:
yt2 = comp1+comp2;
% Presentación de las componentes en forma ascendentes tal como es el diagrama TF ideal:
subplot(3,2,3)
plot(t,yt1);
title('FENÓMENO 1'); xlabel('t(s)');grid on;
subplot(3,2,4)
plot(t,yt2);
title('FENÓMENO 2'); xlabel('t(s)');grid on;
%% Análisis en el Dominio de Frecuencia:
% PERIODOGRAMA SIMPLE DE REFERENCIA (EL MÁS USADO EN EL MUNDO):
N=length(yt1); % numero de muestras de la señal discretizada
FACTOR = 1;
nFFT=2^(ceil(log2(N)))*FACTOR;
PS1 = 20*log10(abs(fft(yt1,nFFT)));
PS2 = 20*log10(abs(fft(yt2,nFFT)));
f=linspace(0,Fs,nFFT);
subplot(3,2,5)
plot(f,PS1,'k');
grid minor
axis([0 Fs/2 min(PS1) max(PS1)]);% [Xmin Xmax Ymin Ymax]
title('Periodograma simple (FENÓMENO 1) '); xlabel('f[Hz]') 
subplot(3,2,6)
plot(f,PS2,'k');
grid minor
axis([0 Fs/2 min(PS2) max(PS2)]);% [Xmin Xmax Ymin Ymax]
title('Periodograma simple (FENÓMENO 2) '); xlabel('f[Hz]') 

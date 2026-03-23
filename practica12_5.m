%% PRÁCTICA 12.5. Comparación entre filtros digitales IIR y FIR en términos de calidad y fase 

clc, close all, clear all
%% Generacion señal suma de tres tonos
Fmax=160;
Fs=10*Fmax;
t=0:1/Fs:5;
x=sin(2*pi*100*t)+sin(2*pi*120*t)+sin(2*pi*140*t);
subplot(2,1,1)
plot(t,x)
title('Señal temporal original')
xlabel('t(seg)')
%% Dominio de la frecuencia:
N = length(x);
FACTOR = 256;
nFFT = 2^ceil(log2(N))*FACTOR; % Cálculo de nFFT 
%Aplico la función  FFT de matlab
X=fft(x,nFFT);
% Se calcula el módulo de los complejos llamado PERIODOGRAMA
Periodograma=abs(X);
%Cálculo del EJE de frecuencias: misma cantidad de puntos que PERIODOGRAMA y que están entre 0 y Fs:
f=linspace(0,Fs,nFFT);
% Con los dos ejes listos, ya solo graficamos:
subplot(2,1,2)
plot(f,Periodograma);
% Por simetría de medio período:
axis([0 Fs/2 0 max(Periodograma)]) 
xlabel('F(Hz)')
title('Periodograma de la señal original')
%% FILTRO PASA BAJAS: pasa solamente la componente de 100 Hz
f1=[0 110 115 (Fs/2)]/(Fs/2); 
m1=[1  1   0    0];
% FILTRO IIR:
orden_IIR=40;
[b1,a1]=yulewalk(orden_IIR,f1,m1);

% FILTRO FIR (REMEZ): 
orden_FIR=100;
b2 = remez(orden_FIR, f1, m1);  
%% Respuestas ideal y real de los filtros
% Visualización de 256 muestras en frecuencia:
w = ((1:256)/256);
h1 = freqz(b1,a1,256);
h2 = freqz(b2,1,256);
figure
subplot(2,1,1)
hold on
plot(f1,m1,'k'); % respuesta ideal
plot(w,abs(h1),'r'); % respuesta real obtenida 
xlabel('Frecuencia Normalizada');
ylabel('Ganancia');
title('Filtro IIR pasa bajas ideal y real para orden n= 20')
legend('ideal','real')
grid minor
subplot(2,1,2)
hold on
plot(f1,m1,'k'); % respuesta ideal
plot(w,abs(h2),'r'); % respuesta real obtenida 
xlabel('Frecuencia Normalizada');
ylabel('Ganancia');
title('Filtro FIR pasa bajas ideal y real para orden n= 100')
legend('ideal','real')
grid minor
%% Diagramas de Bode de los filtros IIR y FIR:
% Visualización de 256 muestras en frecuencia:
figure
freqz(b1,a1,256);
figure
freqz(b2,1,256);
%% Obtención de la señal filtrada usando FILTER:
senial_filtrada_IIR=filter(b1,a1,x);
senial_filtrada_FIR=filter(b2,1,x);
%% Verificación en el dominio de la frecuencia 
% De la señal filtrada uno:
X1=fft(senial_filtrada_IIR,nFFT);
Periodograma1=abs(X1);
% De la señal filtrada dos:
X2=fft(senial_filtrada_FIR,nFFT);
Periodograma2=abs(X2);
figure
subplot(2,1,1)
plot(f,Periodograma1);
% Por simetría de medio período:
axis([0 Fs/2 0 max(Periodograma1)]) 
xlabel('F(Hz)')
title('Periodograma de la señal filtrada con IIR orden 20')
subplot(2,1,2)
plot(f,Periodograma2);
% Por simetría de medio período:
axis([0 Fs/2 0 max(Periodograma2)]) 
xlabel('F(Hz)')
title('Periodograma de la señal filtrada con FIR orden 100')
%% Resultado en el dominio del tiempo:
figure
subplot(2,1,1)
plot(t,senial_filtrada_IIR)
title('Señal filtrada con IIR')
ylabel ('amplitud')
xlabel ('tiempo (seg)')
grid minor
subplot(2,1,2)
plot(t,senial_filtrada_FIR)
title('Señal filtrada con FIR')
ylabel ('amplitud')
xlabel ('tiempo (seg)')
grid minor

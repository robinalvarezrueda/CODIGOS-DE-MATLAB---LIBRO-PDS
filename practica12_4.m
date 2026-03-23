%% PRÁCTICA 12.4. Utilización de todos los filtros básicos

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
%% FILTROS SOLICITADOS:
orden=50;
% 1.-FILTRO PASA BAJAS: pasa solamente la componente de 100 Hz
f1=[0 110 115 (Fs/2)]/(Fs/2); 
m1=[1  1   0    0];
%Obtener coeficientes del filtro:
[b1,a1]=yulewalk(orden,f1,m1);
% 2.-FILTRO PASA BANDA: pasa solamente la componente de 120 Hz
f2=[0 110 115 125 130 (Fs/2)]/(Fs/2); 
m2=[0  0  1    1   0     0];
%Obtener coeficientes del filtro:
[b2,a2]=yulewalk(orden,f2,m2);
% 3.-FILTRO PASA ALTAS: pasa solamente la componente de 140 Hz
f3=[0 125 130 (Fs/2)]/(Fs/2); 
m3=[0  0   1    1   ];
%Obtener coeficientes del filtro:
[b3,a3]=yulewalk(orden,f3,m3);
% 4.-FILTRO ELIMINA BANDA:  solamente se elimina la componente de 120 Hz
f4=[0 110 115 125 130 (Fs/2)]/(Fs/2); 
m4=[1  1   0   0   1    1   ];
%Obtener coeficientes del filtro:
[b4,a4]=yulewalk(orden,f4,m4);
%% Respuestas ideal y real de los filtros
% Visualización de 256 muestras en frecuencia:
w = ((1:256)/256);
h1 = freqz(b1,a1,256);
h2 = freqz(b2,a2,256);
h3 = freqz(b3,a3,256);
h4 = freqz(b4,a4,256);
figure
subplot(2,2,1)
hold on
plot(f1,m1,'k'); % respuesta ideal
plot(w,abs(h1),'r'); % respuesta real obtenida 
xlabel('Frecuencia Normalizada');
ylabel('Ganancia');
title('Filtro pasa bajas ideal y real para orden n= 50')
legend('ideal','real')
grid minor
subplot(2,2,2)
hold on
plot(f2,m2,'k'); % respuesta ideal
plot(w,abs(h2),'r'); % respuesta real obtenida 
xlabel('Frecuencia Normalizada');
ylabel('Ganancia');
title('Filtro pasa banda ideal y real para orden n= 50')
legend('ideal','real')
grid minor
subplot(2,2,3)
hold on
plot(f3,m3,'k'); % respuesta ideal
plot(w,abs(h3),'r'); % respuesta real obtenida 
xlabel('Frecuencia Normalizada');
ylabel('Ganancia');
title('Filtro pasa altas ideal y real para orden n= 50')
legend('ideal','real')
grid minor
subplot(2,2,4)
hold on
plot(f4,m4,'k'); % respuesta ideal
plot(w,abs(h4),'r'); % respuesta real obtenida 
xlabel('Frecuencia Normalizada');
ylabel('Ganancia');
title('Filtro elimina banda ideal y real para orden n= 50')
legend('ideal','real')
grid minor
%% Obtención de la señal filtrada usando FILTER:
senial_filtrada_uno=filter(b1,a1,x);
senial_filtrada_dos=filter(b2,a2,x);
senial_filtrada_tres=filter(b3,a3,x);
senial_filtrada_cuatro=filter(b4,a4,x);
%% Verificación en el dominio de la frecuencia 
% De la señal filtrada uno:
X1=fft(senial_filtrada_uno,nFFT);
Periodograma1=abs(X1);
% De la señal filtrada dos:
X2=fft(senial_filtrada_dos,nFFT);
Periodograma2=abs(X2);
% De la señal filtrada tres:
X3=fft(senial_filtrada_tres,nFFT);
Periodograma3=abs(X3);
% De la señal filtrada cuatro:
X4=fft(senial_filtrada_cuatro,nFFT);
Periodograma4=abs(X4);
figure
subplot(2,2,1)
plot(f,Periodograma1);
% Por simetría de medio período:
axis([0 Fs/2 0 max(Periodograma1)]) 
xlabel('F(Hz)')
title('Periodograma de la señal filtrada uno')
subplot(2,2,2)
plot(f,Periodograma2);
% Por simetría de medio período:
axis([0 Fs/2 0 max(Periodograma2)]) 
xlabel('F(Hz)')
title('Periodograma de la señal filtrada dos')
subplot(2,2,3)
plot(f,Periodograma3);
% Por simetría de medio período:
axis([0 Fs/2 0 max(Periodograma3)]) 
xlabel('F(Hz)')
title('Periodograma de la señal filtrada tres')
subplot(2,2,4)
plot(f,Periodograma4);
% Por simetría de medio período:
axis([0 Fs/2 0 max(Periodograma4)]) 
xlabel('F(Hz)')
title('Periodograma de la señal filtrada cuatro')
%% Resultado en el dominio del tiempo:
figure
subplot(2,2,1)
plot(t,senial_filtrada_uno)
title('Señal filtrada uno')
ylabel ('amplitud')
xlabel ('tiempo (seg)')
grid minor
subplot(2,2,2)
plot(t,senial_filtrada_dos)
title('Señal filtrada dos')
ylabel ('amplitud')
xlabel ('tiempo (seg)')
grid minor
subplot(2,2,3)
plot(t,senial_filtrada_tres)
title('Señal filtrada tres')
ylabel ('amplitud')
xlabel ('tiempo (seg)')
grid minor
subplot(2,2,4)
plot(t,senial_filtrada_cuatro)
title('Señal filtrada cuatro')
ylabel ('amplitud')
xlabel ('tiempo (seg)')
grid minor

%% PRÁCTICA 12.3. Filtrado empleando y sin emplear la función filter de Matlab

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
 
%% FILTRO IIR PASA BAJAS: pasa solamente la componente de 100 Hz

% 1.- Mediante FILTER:
f1=[0 110 115 (Fs/2)]/(Fs/2); 
m1=[1  1   0    0];
orden=10;
[b,a]=yulewalk(orden,f1,m1);
senial_filtrada_filter=filter(b,a,x);

%% 2.- Sin el comando FILTER:
%Añadir ceros dependiendo del orden del filtro
xn=[zeros(1,orden), x];
%Crear un vector de ceros de la longitud del vector x enterior
y_aux=zeros(1,length(xn));
y_out=0;%Declarar la variable de salida del filtro

%Iniciar la solución de la ecuación en diferencias
%El vector a se recorre desde el elemento 2
%El vector b se recorre desde el elemento 1
for k=orden+2:length(x)
    for i=1:1:length(a)-1
        y_out=(b(i)*xn(k-i+1))-(a(i+1)*y_aux(k-i))+y_out;
    end
%Agregar las soluciones a partir del "orden-esimo"
%elemento del vector  y_aux.
    y_aux(k)=y_out;
%Hacer 0 la salida para calcular el siguiente elemento
    y_out=0;
end
%Recortar el vector de filtro para ajustarlo al vector tiempo
%Lo primeros "orden" elementos son condiciones iniciales
senial_filtrada_sin_filter=y_aux(orden+1:length(y_aux));
figure
subplot(2,1,1)
plot(t,senial_filtrada_filter)
grid minor
title('Señal filtrada CON FILTER')
ylabel ('amplitud')
xlabel ('tiempo')
subplot(2,1,2)
plot(t,senial_filtrada_sin_filter)
grid minor
title('Señal filtrada SIN FILTER')
ylabel ('amplitud')
xlabel ('tiempo')
 
%% Verificación en el dominio de la frecuencia 
% De la señal filtrada CON FILTER:
X1=fft(senial_filtrada_filter,nFFT);
Periodograma1=abs(X1);
Periodograma1_norm = Periodograma1/ max(Periodograma1);
% De la señal filtrada dos:
X2=fft(senial_filtrada_sin_filter,nFFT);
Periodograma2=abs(X2);
Periodograma2_norm = Periodograma2/ max(Periodograma2);
figure
hold on
plot(f,Periodograma1_norm,'b');
plot(f,Periodograma2_norm,'r:');
% Por simetría de medio período:
xlim([0 Fs/2]) 
xlabel('F(Hz)')
title('Periodograma de la señal filtrada CON FILTER vs SIN FILTER')
legend('CON FILTER','SIN FILTER')
grid minor

%% PRÁCTICA 5.10. Detección de retardos mediante secuencias de Barker y correlación.

% APLICACIÓN A RADAR o SONAR empleando las secuencias barker
% como secuencias de MAXIMA AUTOCORRELACIÓN.
% SOLO SE HACE LA DEMOSTRACIÓN EN BANDA BASE (sin modulación):
clear all; clc; close all
%% EN EL TRANSMISOR:
%GENERACION DE SECUENCIA DE BARKER DE 13 BITS:
sec_barker=barker(13); %secuencia Barker de longitud 13
 
% Esta señal será la que se transmita:
senal_tx=sec_barker;
n=length(sec_barker);
stem(senal_tx)
title('Señal a transmitir (secuencia de Barker de 13 bits)')
xlabel('bits')
grid on
 
% Se fija la velocidad de transmisión:
Vtx=1000; % en bps
% Tiempo de bit:
tb=1/Vtx;
  
%% EN EL TRAYECTO DE RECORRIDO DE LA SEÑAL SUFRE:
 % a) un retardo aleatorio según la distancia a la que se encuentre 
% el objeto donde chocará la onda y 
% b) se contamina con ruido gaussiano blanco.
 
% a) INTRODUCCIÓN DE UN RETARDO ALEATORIO:
% SE GENERA UN RETARDO ALEATORIO: por ejemplo, entre 30 y 100 tiempos de bit.
%delay=randi(1,1,[30 100]);
delay = randi([30,100],1,1)
% Este retardo es publicado y deberá ser DESCUBIERTO empleando
% la operación de CORRELACIÓN CRUZADA.
disp(['El retardo aleatorio introducido a ser descubierto es: ' num2str(delay) ' mili segundos']);
% La senal retardada sería;
senal_retarda=[zeros(1,delay) senal_tx zeros(1,10)];%senal recibida sin ruido
% Eje de tiempo:
trx=0:tb:tb*(length(senal_retarda)-1);
 
% b) La señal retardada y contaminada con ruido Gaussiano Blanco es:
SNR=3;	
senal_awgn=awgn(senal_retarda,SNR,'measured');
 
%% EN EL RECEPTOR:
% Se recibiría la senial retardada y contaminada:
senal_rx = senal_awgn;
figure
plot(trx,senal_rx)
title('Señal Recibida')
xlabel('tiempo (segundos)')
grid on
 
% DETECCIÓN DE LA SEÑAL ENVIADA (secuencia de Barker)
% POR MEDIO DE LA CORRELACIÓN CRUZADA:
% a) Cálculo de la Correlación Cruzada mediante función propia:
fin=1;
correlacion=[];
i=1;
for i=1:length(senal_rx)-n+1
    aux=senal_rx(i:n+i-1);
    fin=sum(aux.*sec_barker);
    correlacion(i)=fin;
    i=i+1;
end
[y,I]=max(correlacion); %calcula el tiempo en el que ocurre la amplitud máxima de las señales correlacionadas
figure
plot(0:tb:tb*(i-2),correlacion)
title(['El retraso de la Secuencia Barker es: ' num2str(I-1) '  mili segundos']);
xlabel('tiempo (segundos)')
grid on
 
% b) Cálculo de la Correlación Cruzada mediante xcorr de Matlab:
[Correlacion_Xcorr,lags] = xcorr(senal_rx, sec_barker);
% Cálculo del tiempo en el que ocurre la amplitud máxima de las señales correlacionadas
[y2,I2]=max(Correlacion_Xcorr); 
t_Xcorr_max = lags(I2)/Vtx;
%t_Xcorr_max = (I2-1)*tb; %I/Vtx;
 
%Gráfica de la CORRELACIÓN CRUZADA en función de los desplazamientos(lags):
figure
plot(lags/Vtx,Correlacion_Xcorr) %/Fs pues lags está en puntos --> pasa a t(segundos)
grid
xlabel('Lags (s)')
title(['El retraso de la Secuencia Barker es: ' num2str(t_Xcorr_max) '  segundos']);
 

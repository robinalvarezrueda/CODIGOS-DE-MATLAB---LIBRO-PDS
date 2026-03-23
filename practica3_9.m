%% PRÁCTICA 3.9. Adquisición y almacenamiento de señales de audio de manera acumulativa.

clc, clear all, close all;
bloque_adquisicion=1; %tiempo de adquisición de la señal para el recordblocking
Fs=8000; %frecuencia de muestreo suficiente según el teorema del muestreo 
senial_total=[ ];
x=1;
while x<=10  % se adquiere durante 10 segundos
    y=audiorecorder(Fs,16,1);
    recordblocking(y, bloque_adquisicion);  % se adquiere en bloques de 1 segundo
    senial=getaudiodata(y, 'single'); % entrega un vector columna
    %senial = senial';
    L=length(senial);
    t=linspace(0,bloque_adquisicion,L);%creación del vector tiempo
    plot(t,senial);
    grid minor;
    senial_total=[senial_total;senial]; % acumulación de las mediciones
    x=x+1;
end
% grabación de la señal total:
audiowrite('senial.wav', senial_total, Fs);

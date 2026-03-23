%% PRÁCTICA 3.8. Adquisición y almacenamiento de señales de audio en MATLAB.

clear all;close all;clc;
bloque_adquisicion=1;
Fmax = 1000;
Fs=8000; %Fs > 2*Fmax
x=0;
while x==0
    % Crear un objeto con parámetros: fs, 16 bits, 1 canal (de los 2 posibles)
    y=audiorecorder(Fs,16,1);%Creación del objeto para obtención de señal
    % Uso del objeto: adquiere senial en bloques de "duracion" en segundos:
    recordblocking(y, bloque_adquisicion); 
    % GETAUDIODATA: recupera la señal almacenada:
    senial=getaudiodata(y, 'single');
    L=length(senial);%Obtención de tamaño de señal
    t=linspace(0,bloque_adquisicion,L);%creación del vector tiempo
    plot(t,senial);grid on; grid minor;
    title('Señal adquirida con una Fs = 8 KHz')
    axis([0 1 -1 1])
    pause(bloque_adquisicion)
end

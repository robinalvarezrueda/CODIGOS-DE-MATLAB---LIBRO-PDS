%% PRÁCTICA 3.10. Generación y adquisición multicanal de señales de audio.

clc; clear all; close all; 
% SECCIÓN DE GENERACIÓN:
%Frecuencia fundamental triangular
Fo1=1000;
%Frecuencia fundamental diente de Sierra
Fo2=2000;
%Período respecto a frecuencia más restrictiva
T=1/Fo2;
%Duración de la onda: 20 segundos
duracion=20;
%Período de muestreo:
Ts=T/100;
%Vector de tiempo discreto:
tn=0:Ts:duracion;
% Construcción de la onda triangular:
yn1= sawtooth (2*pi*Fo1*tn, 50 / 100); 
% Construcción de la onda Diente de Sierra:  
yn2= sawtooth (2*pi*Fo2*tn, 1);       %diente de Sierra
%% Gráfica de la señal 
    subplot(2,1,1)
    plot(tn,yn1,'ob','MarkerSize',4);
    grid on
    xlabel('Tiempo');
    ylabel('Amplitud');
    title('Onda Triangular 1 KHz');
 
    subplot(2,1,2)
    plot(tn,yn2,'ob','MarkerSize',4);
    grid on
   
%Etiquetas y título
    xlabel('Tiempo');
    ylabel('Amplitud');
    title('Onda Diente de Sierra 2 KHz');
%Fs = 1/Ts;
%sound (yn, Fs)
%Crear la matriz: Columna 1 corresponde al canal 1 y Columna 2 corresponde al canal 2
yn=[yn1' yn2'];
% Verificación auditiva: 
Fs = 1/Ts;
sound (yn, Fs)
 
%% SECCIÓN DE ADQUISICIÓN:
bloque_adquisicion=1;
x=0;
 
while x==0
    % Crear un objeto con parámetros: fs, 16 bits, 2 canales
    y=audiorecorder(Fs3,16,2);%Creación del objeto para obtención de señal
    % Uso del objeto: adquiere senial en bloques de "duracion" en segundos:
    recordblocking(y, bloque_adquisicion); 
    % GETAUDIODATA: recupera la señal almacenada:
    senial=getaudiodata(y, 'single');
    L=length(senial);%Obtención de tamaño de señal
    t=linspace(0,bloque_adquisicion,L);%creación del vector tiempo
    figure
    plot(t,senial);grid on; grid minor;
    title('Señal adquirida con una Fs = 8 KHz')
    axis([0 1 -1 1])
    pause(1)
end

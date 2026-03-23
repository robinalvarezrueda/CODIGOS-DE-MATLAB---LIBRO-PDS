%% PRÁCTICA 8.5. Evolución temporal de la frecuencia máxima del periodograma

clc, clear all, close all
duracion = 10;
fo = 1000;
f1 = 2000; 
Fmax=f1;
Fs = 10*Fmax;
Ts = 1/Fs;
tn = Ts:Ts:duracion;
p=1; % p es el orden del polinomio (p=1: lineal)(p=2: cuadrático)
beta   = (f1-fo)./(duracion.^(p));
fi=fo+beta*tn; %+ para incremento de la frecuencia instantanea
senial_chirp = cos(2*pi*fi.*tn);% operador(.) importante para que no dé error.
plot(tn,senial_chirp);
title('CHIRP: desde 1KHz hasta 2 KHz en 10 segundos');
xlabel('tiempo [s]');
ylabel('Amplitud');
grid minor;
sound(senial_chirp,Fs)

%-----CREACIÓN CÁLCULO DE EVOLUCIÓN DE FMAX-----
tamanio = input("Ingrese el tamaño de la porción que desea ver (%): ");   
Longitud = length(senial_chirp); %Longitud de la señal chirp
Longitud_porciento = Longitud*tamanio/100; %Conversión en porcentaje la longitud de la señal
porciones = floor(100/tamanio); %Cálculo del número de porciones deseadas de la muestra total
factor = 128;  %Factor para la resolución de la nFFT
puntos_nFFT = 2^ceil(log2(Longitud_porciento))*factor;  %Cálculo de puntos nFFT

%Lazo for para recorrer las porciones de la señal
freq = Fs*(0:(puntos_nFFT/2))/puntos_nFFT;      %Vector de frecuencias creado
var1 = 1;   %Variable auxiliar a ser empleada en las porciones del lazo for
var2 = Longitud_porciento; %Variable auxiliar a ser empleada en las porciones del lazo for
for i = 1:porciones
    matriz = senial_chirp(:,var1:var2);                                   
    Y = fft(matriz, puntos_nFFT);                                          
    P = Y(1:puntos_nFFT/2+1);                                             
    [Pmax(i), indice] = max(abs(P));                                       
    F_max(i) = freq(indice);                                                 
    var1 = var1 + Longitud_porciento;                                     
    var2 = var2 + Longitud_porciento;                                     
end

%------GRÁFICA DE LA EVOLUCION DE FMAX---------
t_n = linspace(0,duracion,length(F_max));                           
plot(t_n,F_max,'m-o','LineWidth',1)                                      
title("Evolucion de la Frecuencia máxima")                            
xlabel('Tiempo [seg]')                                                               
ylabel('Frecuencia [Hz]')                                                           
grid minor
 

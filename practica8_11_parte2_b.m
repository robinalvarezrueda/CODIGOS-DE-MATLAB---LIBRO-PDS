%% PRÁCTICA 8.11b- PARTE 2. Tiempo real

clc, close all, clear all
%% Grabación de vocal en menos de 2 segundos:
Fs=44100; %%Frecuencia de muestreo
audio = audiorecorder(Fs,16,1); %Creacion de objeto para grabar voz
disp ('tiene 2 segundos para pronunciar una vocal');
recordblocking(audio,2); %Grabacion dura 2 segundos
disp ('Fin de la Grabacion');
% play(audio); %Sirve para escuchar el audio del usuario.
y=getaudiodata(audio); %Guarda la información del audio en "y"

%% Cálculo del periodograma normalizado de la señal adquirida:
N = length(y);
nFFT = 2^ceil(log2(N))*64; % Cálculo de nFFT (muestras en el tiempo)
Xn = fft(y, nFFT); % Cálculo de los complejos FFT
P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
f = linspace(0, Fs, nFFT); % Eje de frecuencias

%% Cálculo de bandas de frecuencia CARACTERÍSTICAS DE CADA VOCAL:
% Ya se dedujo que existe una banda característica por cada vocal:

%Vocal a: Banda 1 -- (1200-1750)Hz.
P_B1=P(find(f>=1200 & f<=1750));
f_B1=f(find(f>=1200 & f<=1750));
% Área bajo la curva en el intervalo:
B1_suma=sum(P_B1);
 
%Vocal e: Banda 2 -- (2200-2600) Hz
P_B2=P(find(f>=2200 & f<=2600));
f_B2=f(find(f>=2200 & f<=2600));
% Área bajo la curva en el intervalo:
B2_suma=sum(P_B2);
 
%Vocales (i, u): Banda 3 (450-510) Hz
P_B3=P(find(f>=450 & f<=510)); 
f_B3=f(find(f>=450 & f<=510));
% Área bajo la curva en el intervalo:
B3_suma=sum(P_B3);
 
%Vocal o: Banda 4 -- (580-620) Hz 
P_B4=P(find(f>=580 & f<=620));
f_B4=f(find(f>=580 & f<=620));
% Área bajo la curva en el intervalo:
B4_suma=sum(P_B4);
 
%% TOMA DE DICISIONES EN BASE A LA CADA BANDA CARACTERÍSTICA:
if (B1_suma > 15)
    disp('Usted pronunció la vocal "a".')
end
if (B2_suma > 30) 
    disp('Usted pronunció la vocal "e".')
end
if (B3_suma > 5) && (B3_suma < 12) 
    disp('Usted pronunció la vocal "i".')
end
if (B3_suma > 12)  
    disp('Usted pronunció la vocal "u".')
end
if  (B4_suma > 12) 
    disp('Usted pronunció la vocal "o".')
end

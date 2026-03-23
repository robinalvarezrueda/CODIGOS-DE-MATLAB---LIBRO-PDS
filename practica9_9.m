%% PRÁCTICA 9.9. Predicción de la resolución en frecuencia a partir del ancho del lóbulo principal.

clc, close all, clear all
f1=100;
Fmax=f1;
duracion=0.1; 
Fs=10*Fmax; Ts=1/Fs;
n=0:Ts: duracion; % base de tiempos (discreto)
xn=sin(2*pi*f1*n); % vector de amplitudes
% DOMINIO DE LA FRECUENCIA:
N=length(xn);
FACTOR=16;
nFFT = 2^ceil(log2(N))*FACTOR; % Cálculo de nFFT (muestras en el tiempo)
% PERIODOGRAMA SIMPLE
Xn=fft(xn,nFFT);
P=20*log10(abs(Xn));
% Se toma la primera mitad pues la segunda es duplicada:
P=P(1:nFFT/2+1);
% Eje de frecuencias normalizado
f=1:nFFT/2+1;
f_norm=f/(nFFT/2);
%Medición de ancho de lóbulo principal a -6dB
P_max = max(P);
P_6dB= fix(max(P))-6;  %Valor a – 6db
indice_P_6dB= find(fix(P) == P_6dB);
f_norm_6dB = f_norm(indice_P_6dB);
%Desnormalización:
Index = f_norm_6dB* (nFFT / 2); 
Frec_cercana=Index*(Fs/nFFT);
% Considerando solamente un acercamiento por la derecha de f1
for i=1:length(Frec_cercana)
    if Frec_cercana(i)>f1
        Prediccion(i)=Frec_cercana(i); %Frecuencias superiores a f1
    end
end
Prediccion(Prediccion==0)=[]; %Eliminando los ceros del vector
Prediccion=round(mean(Prediccion),1) %Obteniendo la frecuencia cercana promedio

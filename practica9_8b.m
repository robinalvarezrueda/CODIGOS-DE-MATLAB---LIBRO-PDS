%% PRÁCTICA 9.8a. CÁLCULO DE LOS DOS PARÁMETROS MEDIANTE CÓDIGO PROPIO

clc, clear all, close all
L = 25; % Longitud de la ventana
xn = mi_rectangular(L);
%% DOMINIO DE LA FRECUENCIA:
N=length(xn);
nFFT = 2^ceil(log2(N))*128; % Cálculo de nFFT (muestras en el tiempo)
%PERIODOGRAMA SIMPLE
Xn=fft(xn,nFFT);
P=20*log10(abs(Xn));
% Creación del eje de frecuencias normalizado igual que wvtool:
f = 1:1:nFFT;
f_norm = f/(nFFT/2);
%% Medición del delta de amplitudes (pico principal - pico secundario)
% La función findpeaks no reconoce como el pico principal por lo que usa 
% la instrucción max
[pks,locs] = findpeaks(P, f_norm);  
Delta=pks(1)-max(P); %interesa en valor absoluto
%% Medición de ancho de lóbulo principal a -3dB:
P_max = max(P);
P_3dB= fix(max(P))-3;  %máximo - 3db
indice_P_3dB= find(fix(P) == P_3dB);
f_norm_3dB = f_norm(indice_P_3dB);
Ancho_3dB = 2*f_norm_3dB (1);
subplot(1,2,1); 
plot(xn,'x');  
title('Ventana en el dominio del tiempo');  
xlabel('Muestras');  
ylabel('Amplitud');  
axis([0 25 0 max(xn)+0.2]);  
subplot(1,2,2);  
plot(f_norm,P);  
text(Ancho_3dB+0.1, pks(1)+ 10, ['Ancho del lóbulo principal (-3dB): ' num2str(Ancho_3dB)]);  
text(Ancho_3dB+0.1, pks(1)+ 4, ['Delta (principal-secundario): ' num2str(Delta)]);  
title('Dominio de frecuencia');  
ylabel('Magnitud en (dB)');  
xlabel('Frecuencia Normalizada');  
axis([0 1 min(P)-5 max(P)+5]);

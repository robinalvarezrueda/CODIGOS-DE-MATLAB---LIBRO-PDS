%% PRÁCTICA 7.2. Implementación progresiva de una FFT basada en patrones de simetría

clc , clear all, close all
% Creación de la señal a Analizar:
Factor = 8; % La cantidad de complejos 8 
F1 = 0.2; 
F2 = 0.5;
F3 = 1;
Fmax = 1; % frecuencia máxima
Fs = Factor*Fmax; %frecuencia de muestreo 
Ts = 1/Fs; % periodo de muestreo 
duracion =1;
t = Ts:Ts:duracion;
x = sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t); %  señal 
stem(t, x,'r', 'linewidth',3)
title(' Señal discretizada de 8 Muestras')
xlabel('t(segundos)')
 
% Reorganización de bits 
x = bitrevorder(x);
 
N = length(x); % dimensión de la señal
M = log2(N);   % potencia de 2 más cercano N =8 ; M =3
Ne = N;
 
% inicialización para diferentes etapas 
etapa1 = zeros(1,Ne); % etapa 1 
etapa2 = zeros(1,Ne);% etapa 2 
etapa3 = zeros(1,Ne);% etapa 3
 
for l = 1:M  % contador desde 1 hasta las M muestras
    if l==1 % para hacer la dft de dos muestras  de la señal x 
        for t=0:2:Ne-1  
            % cuando t = 0 etapa1(t+1:t+2) toma los valores que tiene etapa1 en
            % la posicion 1 y 2 
            etapa1(t+1:t+2) = etapa1(t+1:t+2) + mi_fft (x(t+1:t+2),2^l);
        end
        coeficientes = etapa1;
    end
    if l==2
        for k=0:4:Ne-1 %dft de 4 muestras 
            % temp2(k+1:k+4) toma los valores de las 4 posiciones de temp2
            etapa2(k+1:k+4) = etapa2(k+1:k+4) + mi_fft (etapa1(k+1:k+4),2^l);
        end  
        coeficientes= etapa2;
    end
    if l==3 %dft de 8 muestras 
        for k=0:8:Ne-1
            etapa3(k+1:k+8) = etapa3(k+1:k+8) + mi_fft (etapa2(k+1:k+8),2^l);
        end  
        coeficientes= etapa3;
   end
end
% Uso de la función dft_vectorial para comparar coeficientes 
x_dft = dft_vectorial (x);
Comprobacion = x_dft';
Prueba = coeficientes'; 
 %Resultados
Resultados= [Comprobacion Prueba]


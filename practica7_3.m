%% PRÁCTICA 7.3. Comparación de carga computacional entre DFT directa, FFT propia y FFT de Matlab

clc , clear all, close all
% Numero de muestras ingresado por el usuario
Factor = input('Ingrese el número de muestras:')
% Creación de la señal 
F1 = 0.2;
F2 = 0.5;
F3 = 1;
Fmax = 1; % frecuencia máxima
Fs = Factor*Fmax; %frecuencia de muestreo
Ts = 1/Fs; % periodo de muestreo
duracion =1;
t = Ts:Ts:duracion;
x = sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t); %  señal
%plot(t,x) % Grafica en funcion del tiempo
stem(t, x,'r', 'linewidth',3)
title(' Señal discretizada')
xlabel('t(segundos)')
 
N = length(x); % Dimensión de la señal 
M = log2(N); % Determina el número de Etapas
 
% Aproximación al múltiplo más cercano de 2^p en caso de no serlo 
if (rem(M,1) ~= 0)
    re =rem(M,1);
    M=M-re+1;
    Ne = 2^M; 
    x = [x,zeros(1,Ne-N)]; % vector dimensión 2^p con las muestras iniciales y añadir ceros para completar el vector
else
    Ne = N; 
end
% Reorganización de bits
x = bitrevorder(x);
 
%% Nuestro programa:
disp('Tiempo con NUESTRA fft')
tic
% inicialización para diferentes etapas
etapa = zeros(1,Ne); % etapa n
 
for l = 1:M  % contador desde 1 hasta las M
    if l==1 % para hacer la dft de dos muestras de la señal x
        for t=0:2:Ne-1
            % cuando t = 0 etapa1(t+1:t+2) toma los valores que tiene etapa1 en
            % la posicion 1 y 2
            etapa(t+1:t+2) = etapa(t+1:t+2) + mi_fft (x(t+1:t+2),2^l);
        end
        coeficientes = etapa;
    
    else
        
    etapa = zeros(1,Ne);
    for k=0:2^(l):Ne-1 %dft de N muestras
        % temp2(k+1:k+4) toma los valores de las N posiciones
        etapa(k+1:k+(2^(l))) = etapa(k+1:k+(2^(l))) + mi_fft (coeficientes(k+1:k+(2^(l))),2^l);
    end
    coeficientes= etapa;
    end
end
toc

% Uso de la función dft_vectorial para comparar coeficientes
tic
x_dft =dft_vectorial(x);
toc
 
disp('Tiempo empleando, usando la fft de Matlab')
tic
x_fft =fft(x, Ne);
toc
Comprobacion = x_dft';
Prueba = coeficientes';
%Resultados
Resultados= [Comprobacion Prueba];

%% PRÁCTICA 8.11- PARTE 2. Diferenciación entre las vocales pronunciadas por una persona 

clc, close all, clear all
%% Lectura de archivos de audio
%vocal a
for i=1:1:10
    nombre=sprintf('a%d.wav', i);
    [vocal_a{i},Fs] = audioread([pwd '\BaseDatosVocales\', nombre]);
end
%vocal e
for i=1:1:10
    nombre=sprintf('e%d.wav', i);
    [vocal_e{i},Fs] = audioread([pwd '\BaseDatosVocales\', nombre]);
end
%vocal i
for i=1:1:10
    nombre=sprintf('i%d.wav', i);
    [vocal_i{i},Fs] = audioread([pwd '\BaseDatosVocales\', nombre]);
end
%vocal o
for i=1:1:10
    nombre=sprintf('o%d.wav', i);
    [vocal_o{i},Fs] = audioread([pwd '\BaseDatosVocales\', nombre]);
end
%vocal u
for i=1:1:10
    nombre=sprintf('u%d.wav', i);
    [vocal_u{i},Fs] = audioread([pwd '\BaseDatosVocales\', nombre]);
end
%% DOMINIO DE LA FRECUENCIA: CÁLCULO DEL PERIODOGRAMA
% Cálculo de los periodogramas:
N = length(vocal_a{1,1});% será lo mismo para las otras vocales
nFFT = 2^ceil(log2(N))*1; % Cálculo de la nFFT
 
f = linspace(0, Fs, nFFT); % Eje de frecuencias
f = f(1:nFFT/2+1); % Simetría de medio período

%%Para la letra "a":
for i=1:1:10
    Xn = fft(vocal_a{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro
    
    % Cálculo de las 4 bandas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_A(i,1) = sum(P_Area);
    Aa1(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_A(i,2) = sum(P_Area);
    Aa2(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_A(i,3) = sum(P_Area);
    Aa3(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_A(i,4) = sum(P_Area);
    Aa4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMAS DE LAS 10 VOCALES A');
    xlabel('Frecuencia [Hz]');
    ylabel('Amplitud');
    leyendas{i}=['a' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end 
%legend(leyendas);
grid minor
hold off
    
%%Para la letra "e":
figure
for i=1:1:10
    Xn = fft(vocal_e{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro
    % Cálculo de las 4 bandas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_E(i,1) = sum(P_Area);
    Ae1(i)=sum(P_Area);

    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_E(i,2) = sum(P_Area);
    Ae2(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_E(i,3) = sum(P_Area);
    Ae3(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_E(i,4) = sum(P_Area);
    Ae4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMAS DE LAS 10 VOCALES E');
    xlabel('Frecuencia [Hz]');
    ylabel('Amplitud');
    leyendas{i}=['e' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end
grid minor
hold off
     
%%Para la letra "i":
figure
for i=1:1:10
    Xn = fft(vocal_i{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro
    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_I(i,1) = sum(P_Area);
    Ai1(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_I(i,2) = sum(P_Area);
    Ai2(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_I(i,3) = sum(P_Area);
    Ai3(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_I(i,4) = sum(P_Area);
    Ai4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMAS DE LAS 10 VOCALES I');
    xlabel('Frecuencia [Hz]');
    ylabel('Amplitud');
    leyendas{i}=['i' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end 
%legend(leyendas);
grid minor
hold off
     
%%Para la letra "o":
figure
for i=1:1:10
    Xn = fft(vocal_o{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro

    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_O(i,1) = sum(P_Area);
    Ao1(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_O(i,2) = sum(P_Area);
    Ao2(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_O(i,3) = sum(P_Area);
    Ao3(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_O(i,4) = sum(P_Area);
    Ao4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMAS DE LAS 10 VOCALES O');
    xlabel('Frecuencia [Hz]');
    ylabel('Amplitud');
    leyendas{i}=['o' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end 
grid minor
hold off
    
%%Para la letra "u":
figure
for i=1:1:10
    Xn = fft(vocal_u{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro

    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_U(i,1) = sum(P_Area);
    Au1(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_U(i,2) = sum(P_Area);
    Au2(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_U(i,3) = sum(P_Area);
    Au3(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_U(i,4) = sum(P_Area);
    Au4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMAS DE LAS 10 VOCALES U');
    xlabel('Frecuencia [Hz]');
    ylabel('Amplitud');
    leyendas{i}=['u' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end 
grid minor
hold off

%% GRÁFICOS DE CAJAS Y BIGOTES PARA CADA BANDA DE FRECUENCIA:
figure
Areas=[Aa1 Ae1 Ai1 Ao1 Au1]';
Vocales=importdata("Vocales.txt");
subplot(1,4,1)
boxplot(Areas,Vocales)
title('Variable 1: Banda de 1200 a 1750 Hz')
yline(15,'g')
grid minor
Areas2=[Aa2 Ae2 Ai2 Ao2 Au2]';
subplot(1,4,2)
boxplot(Areas2,Vocales)
title('Variable 2: Banda de 2200 a 2600 Hz')
yline(30,'g')
grid minor
Areas3=[Aa3 Ae3 Ai3 Ao3 Au3]';
subplot(1,4,3)
boxplot(Areas3,Vocales)
title('Variable 3: Banda de 450 a 510 Hz')
yline(12,'g')
yline(5,'g')
grid minor
Areas4=[Aa4 Ae4 Ai4 Ao4 Au4]';
subplot(1,4,4)
boxplot(Areas4,Vocales)
title('Variable 4: Banda de 580 a 620 Hz')
yline(12,'g')
grid minor

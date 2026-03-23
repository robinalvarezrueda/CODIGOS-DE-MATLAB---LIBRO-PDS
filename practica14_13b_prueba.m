% Práctica 14.13b. CONJUNTO DE PRUEBA
% VERIFICACIÓN DE LA MLP YA ENTRENADA MEDIANTE LA CLASIFICACIÓN DE LOS ARCHIVOS DEL DIRECTORIO DE PRUEBA

clc, close all, clear all
%% Comprobación: lectura de los pesos ya entrenados
load pesos_W1_W2

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 1. EXTRACCIÓN DE CARACTERÍSTICAS DE PRUEBA:
%% ZONA DE DATOS:
% % ENTRADAS:
Num_prueba = 4; % 1, 3, 6, 8, 10; % Número de vocales que se emplearán para el ENTRENAMIENTO, 
%Letras a
for i=1:1:Num_prueba
    nombre=sprintf('a%d.wav', i);
    [vocal_a{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
%Letras e
for i=1:1:Num_prueba
    nombre=sprintf('e%d.wav', i);
    [vocal_e{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
%Letras i
for i=1:1:Num_prueba
    nombre=sprintf('i%d.wav', i);
    [vocal_i{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
%Letras o
for i=1:1:Num_prueba
    nombre=sprintf('o%d.wav', i);
    [vocal_o{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
%Letras u
for i=1:1:Num_prueba
    nombre=sprintf('u%d.wav', i);
    [vocal_u{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end

%% DOMINIO DE LA FRECUENCIA: CÁLCULO DEL PERIODOGRAMA
% Cálculo de los periodogramas:
N = length(vocal_a{1,1});% será lo mismo para las otras vocales
nFFT = 2^ceil(log2(N))*1; % Cálculo de la nFFT
 
f = linspace(0, Fs, nFFT); % Eje de frecuencias
f = f(1:nFFT/2+1); % Simetría de medio período

%%Para la vocal "a":
for i=1:1:Num_prueba
    Xn = fft(vocal_a{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro
    
    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_A(i,1) = sum(P_Area);
    %Aa1(i)=sum(P_Area);
    B1a(i)=sum(P_Area);

    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_A(i,2) = sum(P_Area);
    %Aa2(i)=sum(P_Area);
    B2a(i)=sum(P_Area);

    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_A(i,3) = sum(P_Area);
    %Aa3(i)=sum(P_Area);
    B3a(i)=sum(P_Area);

    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_A(i,4) = sum(P_Area);
    %Aa4(i)=sum(P_Area);
    B4a(i)=sum(P_Area);
end 

%%Para la vocal "e":
for i=1:1:Num_prueba
    Xn = fft(vocal_e{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro
 
    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_E(i,1) = sum(P_Area);
    %Ae1(i)=sum(P_Area);
    B1e(i)=sum(P_Area);

    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_E(i,2) = sum(P_Area);
    %Ae2(i)=sum(P_Area);
    B2e(i)=sum(P_Area);

    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_E(i,3) = sum(P_Area);
    %Ae3(i)=sum(P_Area);
    B3e(i)=sum(P_Area);

    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_E(i,4) = sum(P_Area);
    %Ae4(i)=sum(P_Area);
    B4e(i)=sum(P_Area);
end 
     
%%Para la vocal "i":
for i=1:1:Num_prueba
    Xn = fft(vocal_i{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro

    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_I(i,1) = sum(P_Area);
    %Ai1(i)=sum(P_Area);
    B1i(i)=sum(P_Area);

    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_I(i,2) = sum(P_Area);
    %Ai2(i)=sum(P_Area);
    B2i(i)=sum(P_Area);

    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_I(i,3) = sum(P_Area);
    %Ai3(i)=sum(P_Area);
    B3i(i)=sum(P_Area);

    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_I(i,4) = sum(P_Area);
    %Ai4(i)=sum(P_Area);
    B4i(i)=sum(P_Area);
end 
     
%%Para la vocal "o":
for i=1:1:Num_prueba
    Xn = fft(vocal_o{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro

    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_O(i,1) = sum(P_Area);
    %Ao1(i)=sum(P_Area);
    B1o(i)=sum(P_Area);

    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_O(i,2) = sum(P_Area);
    %Ao2(i)=sum(P_Area);
    B2o(i)=sum(P_Area);

    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_O(i,3) = sum(P_Area);
    %Ao3(i)=sum(P_Area);
    B3o(i)=sum(P_Area);

    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_O(i,4) = sum(P_Area);
    %Ao4(i)=sum(P_Area);
    B4o(i)=sum(P_Area);
end 
    
%%Para la vocal "u":
for i=1:1:Num_prueba
    Xn = fft(vocal_u{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro

    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_U(i,1) = sum(P_Area);
    %Au1(i)=sum(P_Area);
    B1u(i)=sum(P_Area);

    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_U(i,2) = sum(P_Area);
    %Au2(i)=sum(P_Area);
    B2u(i)=sum(P_Area);

    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_U(i,3) = sum(P_Area);
    %Au3(i)=sum(P_Area);
    B3u(i)=sum(P_Area);

    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_U(i,4) = sum(P_Area);
    %Au4(i)=sum(P_Area);
    B4u(i)=sum(P_Area);
end 

%% Todos los vectores B1a, B1e,.... B4u  YA ESTAN COMO VECTORES FILA
%% ESQUEMA DE LA MATRIZ x_prueba:
%        a1  a2 .... a10   e1 .. e10   ...    u1  .... u10
% B1          B1a(fila)     B1e(fila)          B1u(fila)
% B2          B2a(fila)     B2e(fila)          B2u(fila)
% B3          B3a(fila)     B3e(fila)          B3u(fila)
% B4          B4a(fila)     B4e(fila)          B4u(fila)

% VERIFICACIÓN: Fig. 14.30 
x_prueba = [B1a B1e B1i B1o B1u;...
            	    B2a B2e B2i B2o B2u;...
                   B3a B3e B3i B3o B3u;...
          	   B4a B4e B4i B4o B4u];

%% Salidas de la MLP:
Num_vocales_a = 0;
Num_vocales_e = 0;
Num_vocales_i = 0;
Num_vocales_o = 0;
Num_vocales_u = 0;

for i=1:1:Num_prueba*5 % MAXIMO son 100 vocales a probar en total (10 DE CADA TIPO)
    output_MLP(:,i) = logistic(W2*[1;logistic(W1*[1;x_prueba(:,i)])])';
end

for i=1:1:Num_prueba*5    % MAXIMO son 100 vocales a probar en total (10 DE CADA TIPO)
    % Para que sea la A: 0 0 0
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vocales_a=Num_vocales_a+1;
    end
    % Para que sea la E: 0 0 1
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) > 0.5)
       Num_vocales_e=Num_vocales_e+1;
    end
    % Para que sea la I: 0 1 0
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) > 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vocales_i=Num_vocales_i+1;
    end
    % Para que sea la O: 0 1 1
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) > 0.5) && (output_MLP(3,i) > 0.5)
       Num_vocales_o=Num_vocales_o+1;
    end
    % Para que sea la U: 1 0 0
    if (output_MLP(1,i) > 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vocales_u=Num_vocales_u+1;
    end
end

% CANTIDAD DE VOCALES DETECTADAS DE CADA TIPO:
disp(['La cantidad de vocales reconocidas como "a" es: ',num2str(Num_vocales_a)])
disp(['La cantidad de vocales reconocidas como "e" es: ',num2str(Num_vocales_e)])
disp(['La cantidad de vocales reconocidas como "i" es: ',num2str(Num_vocales_i)])
disp(['La cantidad de vocales reconocidas como "o" es: ',num2str(Num_vocales_o)])
disp(['La cantidad de vocales reconocidas como "u" es: ',num2str(Num_vocales_u)])

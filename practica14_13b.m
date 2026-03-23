%% práctica 14.13b. PROGRAMA DE ENTRENAMIENTO --- SOLAMENTE SECCIÓN DE DATOS

clc, close all, clear all
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 1. INICIO DE LA SECCIÓN DE DATOS (según Fig. 4.8):
% Conjunto de entrenamiento como VECTORES COLUMNA

% % ENTRADAS:
Num_entrenamiento = 10; % 1, 3, 6, 8, 10; % Número de vocales que se emplearán para el ENTRENAMIENTO, 
%Vocal a:
for i=1:1:Num_entrenamiento
    nombre=sprintf('a%d.wav', i);
    [vocal_a{i},Fs] = audioread([pwd '\Vocales_entrenamiento\', nombre]);
end
% Vocal e
for i=1:1:Num_entrenamiento
    nombre=sprintf('e%d.wav', i);
    [vocal_e{i},Fs] = audioread([pwd '\Vocales_entrenamiento\', nombre]);
end
% Vocal i
for i=1:1:Num_entrenamiento
    nombre=sprintf('i%d.wav', i);
    [vocal_i{i},Fs] = audioread([pwd '\Vocales_entrenamiento\', nombre]);
end
% Vocal o
for i=1:1:Num_entrenamiento
    nombre=sprintf('o%d.wav', i);
    [vocal_o{i},Fs] = audioread([pwd '\Vocales_entrenamiento\', nombre]);
end
% Vocal u
for i=1:1:Num_entrenamiento
    nombre=sprintf('u%d.wav', i);
    [vocal_u{i},Fs] = audioread([pwd '\Vocales_entrenamiento\', nombre]);
end

%% DOMINIO DE LA FRECUENCIA: CÁLCULO DEL PERIODOGRAMA
% Cálculo de los periodogramas:
N = length(vocal_a{1,1});% será lo mismo para las otras vocales
nFFT = 2^ceil(log2(N))*1; % Cálculo de la nFFT
 
f = linspace(0, Fs, nFFT); % Eje de frecuencias
f = f(1:nFFT/2+1); % Simetría de medio período

%%Para la vocal "a":
for i=1:1:Num_entrenamiento
    Xn = fft(vocal_a{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro
    
    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_A(i,1) = sum(P_Area);
    B1a(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_A(i,2) = sum(P_Area);
    B2a(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_A(i,3) = sum(P_Area);
    B3a(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_A(i,4) = sum(P_Area);
    B4a(i)=sum(P_Area);
end 

%%Para la vocal "e":
for i=1:1:Num_entrenamiento
    Xn = fft(vocal_e{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro
    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_E(i,1) = sum(P_Area);
    B1e(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_E(i,2) = sum(P_Area);
    B2e(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_E(i,3) = sum(P_Area);
    B3e(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_E(i,4) = sum(P_Area);
    B4e(i)=sum(P_Area);
end 
     
%%Para la vocal "i":
for i=1:1:Num_entrenamiento
    Xn = fft(vocal_i{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro

    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_I(i,1) = sum(P_Area);
    B1i(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_I(i,2) = sum(P_Area);
    B2i(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_I(i,3) = sum(P_Area);
    B3i(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_I(i,4) = sum(P_Area);
    B4i(i)=sum(P_Area);
end 
     
%%Para la vocal "o":
for i=1:1:Num_entrenamiento
    Xn = fft(vocal_o{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro

    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_O(i,1) = sum(P_Area);
    B1o(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_O(i,2) = sum(P_Area);
    B2o(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_O(i,3) = sum(P_Area);
    B3o(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_O(i,4) = sum(P_Area);
    B4o(i)=sum(P_Area);
end 
    
%%Para la vocal "u":
for i=1:1:Num_entrenamiento
    Xn = fft(vocal_u{i}, nFFT); % Cálculo de los complejos FFT
    P = abs(Xn)/max(abs(Xn)); %Periodograma normalizado
    P = P(1:nFFT/2+1); % Extracción de la mitad del espectro

    % Cálculo de las 4 áreas:
    % Banda 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_U(i,1) = sum(P_Area);
    B1u(i)=sum(P_Area);
    % Banda 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_U(i,2) = sum(P_Area);
    B2u(i)=sum(P_Area);
    % Banda 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_U(i,3) = sum(P_Area);
    B3u(i)=sum(P_Area);
    % Banda 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_U(i,4) = sum(P_Area);
    B4u(i)=sum(P_Area);
end 
%% Todos los vectores B1a, B1e,.... B4u  YA ESTAN COMO VECTORES FILA
%% ESQUEMA DE LA MATRIZ x:
%          a1  a2 .... a10        e1 .. e10   ...    u1  .... u10
% B1          B1a(fila)            B1e(fila)            B1u(fila)
% B2          B2a(fila)            B2e(fila)            B2u(fila)
% B3          B3a(fila)            B3e(fila)            B3u(fila)
% B4          B4a(fila)            B4e(fila)            B4u(fila)

% VERIFICACIÓN: Fig. 4.27. 
x = [B1a B1e B1i B1o B1u;...
      B2a B2e B2i B2o B2u;...
      B3a B3e B3i B3o B3u;...
      B4a B4e B4i B4o B4u];
% VERIFICADO según Fig.3.30 //
% (probado hasta con todos los 10 archivos: Num_entrenamiento=10) //

%% Salidas deseadas como VECTORES COLUMNA:
%Salida en modo no binario 
aa=[0 0 0]';
ee=[0 0 1]';
ii=[0 1 0]';
oo=[0 1 1]';
uu=[1 0 0]';
 
% % aa=[0 0 0 0 0]';
% % ee=[0 0 0 1 0]';
% % ii=[0 0 1 0 0]';
% % oo=[0 1 0 0 0]';
% % uu=[1 0 0 0 0]';

t_a=[repmat(aa,1, Num_entrenamiento)];
t_e=[repmat(ee,1, Num_entrenamiento)];
t_i=[repmat(ii,1, Num_entrenamiento)];
t_o=[repmat(oo,1, Num_entrenamiento)];
t_u=[repmat(uu,1, Num_entrenamiento)];
t=[t_a t_e t_i t_o t_u];

% FIN DE LA SECCIÓN DE DATOS
% VERIFICADA LA CONVERGENCIA CON EL ERROR = 0.1 PARA TODOS LOS CASO DE
% Num_entrenamiento //
% No hizo falta NORMALIZACIONES

% CONTINUA EL RESTO DEL CÓDIGO DE LA PRÁCTICA 14.10
% después de FIN DE LA SECCIÓN DE DATOS:

% Entonces, copiar aquí desde el siguiente código:
% Verificación de compatibilidad de dimensiones de x con t:
%[entradas,patrones1]=size(x);
%[salidas,patrones2]=size(t);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verificación de compatibilidad de dimensiones de x con t:
[entradas,patrones1]=size(x);
[salidas,patrones2]=size(t);
 
if patrones1 ~= patrones2
error('El número de elementos de entrada tiene que ser el mismo que el de salidas deseadas.')
end

num_terminos=salidas*patrones2;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 2. Escalado de las entradas (si son muy grandes) -- NORMALIZACIÓN ESTADÍSTICA: Ec.14.39
%% PASO 2. Escalado de las entradas (si son muy grandes)
% Normalización de datos respecto de su máximo:
x= x./max(x);
% % NORMALIZACIÓN ESTADÍSTICA: 
% [xn] = normalizacion_estadistica(x); 
% x = xn;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 3. Establecimiento del número de neuronas en la capa oculta: 
% número de neuronas en la capa oculta -- experimentar para ver su efecto
neuronas_capa_oculta = input('¿Cuántas neuronas desea en la capa oculta? '); 

%% Verificación de la estructura de la red neuronal:
fprintf('\nEsta red tiene:\n\n');
fprintf(' %0.f neuronas de entrada\n', entradas);
fprintf(' %0.f neuronas en la capa oculta\n', neuronas_capa_oculta);
fprintf(' %0.f neuronas de salida\n\n', salidas);
fprintf('Hay %0.f pares de entradas/salidas.\n\n', patrones2);
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 4. Inicialización aleatoria de pesos de la red:  
% Pesos de la capa oculta en función del número de neuronas de la capa
% oculta y del número de neuronas de entrada:
W1=0.5*randn(neuronas_capa_oculta, entradas+1); 

% Pesos de la capa de salida en función del número de neuronas de la capa
% oculta y del número de neuronas de salida:

W2=0.5*randn(salidas, neuronas_capa_oculta+1);                      
  
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 5. Establecimiento de criterios de parada:
% Primero criterio de parada: número máximo de ciclos 
% Segundo criterio de parada: mínimo SSE
% Parámetros por defecto: 
fprintf('\n\nLos parámetros por defecto son:\n\n');
fprintf('Tolerancia en el error de salida (SSE) = 0.1\n'); 
SSE_Deseado = 0.1; 
fprintf('Máximo número de ciclos de entrenamiento= 5000.\n'); num_ciclos = 5000;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PASO 6: Establecimiento de la tasa de aprendizaje inicial (Lr)
% Parámetro por defecto: 
fprintf('La tasa inicial de aprendizaje es = 0.1.\n'); Lr = 0.1;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 7. Declaración de variables para graficar el error: 
SSE=zeros(1,num_ciclos);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 8. Colocación del bias como entrada:
X=[ones(1,patrones2); x];
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 9. Bucle de aprendizaje:
for i=1:num_ciclos
    %PASO 9.1 Salida de la capa oculta con función logística:
    h=logistic(W1*X);
    
    %PASO 9.2: Algoritmo para evaluar el error planteado SSE
    % Salida de la capa oculta pero antes de la función de activación:
    H=[ones(1,patrones2);h];% Hidden layer output
   
    % SALIDA DE LA MLP:
    salida = logistic(W2*H);% Output Vector
    % Error a la salida de la MLP:
    e = t-salida;
    % Suma del error cuadrático medio
    SSE(i) = sqrt(sum(sum(e.^2))/num_terminos);% Root mean squared error: Ec.14.38
    % ===========================================================
    %PASO 9.3: Chequeo de criterio de parada respecto del SSE_Deseado
    if SSE(i)<SSE_Deseado; 
        break;
    end
    % ===========================================================
    %PASO 9.4: TASA DE APRENDIZAJE ADAPTATIVA:
    if SSE(i)<=SSE(max((i-1),1)) 
        Lr=Lr*1.1; 
    else 
        Lr=Lr*0.1;
    end
    % ===========================================================
    %PASO 9.5. Actualización de los pesos de la capa de salida (W2)
    % Funciones de activación logísticas:
        
    % Tamaño de paso para W2:
    % delta_W1= w(k+1)- w(k) = 2*Lr*(t-a)*a*(1-a)*X2;   % X2 = H'; a=salida
    % delta_W1= w(k+1)- w(k) = 2*Lr*a*(1-a)*(t-a)*X2;   % X2 = H'; a=salida

    delta_W2= 2*Lr* (salida.*(1-salida).*(t-salida))*H'; % Ec.14.26.
    
    %Actualización de los pesos de la capa de salida (W2)
    W2 = W2+delta_W2; 
    % ===========================================================
    %PASO 9.6. Actualización de los pesos de la capa oculta (W1):
    % Funciones de activación logísticas:
    
    % Tamaño de paso para W1:
    % delta_W1 = w(k+1)- w(k) = 2∙Lr.(t-a)∙a(1-a)∙W2∙h(1-h)∙X1
    % delta_W1 = w(k+1)- w(k) = 2∙Lr.h(1-h)∙W2.(t-a)∙a(1-a)∙W2∙X1
    % delta_W1 = w(k+1)- w(k) = 2∙Lr.h(1-h)∙W2∙a(1-a).(t-a)∙X1; % X1:entradas; 
    delta_W1 = 2*Lr*h.*(1-h).*(W2(:,2:neuronas_capa_oculta+1)'*((salida.*(1-salida)).*(t-salida)))*X'; % Ec.14.35.
    %Actualización de los pesos de la capa oculta (W1):
    W1 = W1+delta_W1; 
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PASO 10. Gráfico de evolución del ERROR:
SSE=nonzeros(SSE);
semilogy(SSE);
title('Entrenamiento con retropropagación');
xlabel('Ciclos');
ylabel('Error SSE')
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PASO 11. Aviso de convergencia de la MLP en tantos ciclos o épocas:
if i<num_ciclos;
   fprintf('Objetivo de error alcanzado en %i ciclos.', i);
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PASO 12. Grabación de pesos al final del entrenamiento:
save pesos_W1_W2 W1 W2

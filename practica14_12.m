%% PRÁCTICA 14.12: APLICACIÓN AL RECONOCIMIENTO DE LETRAS - ENTRENAMIENTO

%% PROGRAMA DE ENTRENAMIENTO GENERALIZADO:
% Este PROGRAMA tiene una MLP con algoritmo de aprendizaje de retro-propagación entrenado en lote 
% Esta MLP tiene en la capa oculta neuronas con funciones de activación logísticas y 
% una capa de salida con funciones de activación lineales.
% x: son las entradas como VECTORES COLUMNA
% t: son las salidas deseadas (target outputs) como VECTORES COLUMNA
clc, close all, clear all
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PASO 1. SECCIÓN DE DATOS (según Fig. 14.8):
% Conjunto de entrenamiento como VECTORES COLUMNA

% % ENTRADAS:
%% Entradas: letras individuales como VECTORES COLUMNA:     
A=[0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
B=[1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0]';
C=[1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1]';
D=[1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0]';
E=[1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1]';
F=[1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0]';
G=[0 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 1 1 1 0 0 0 1 0 1 1 1 1]';
H=[1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
I= [0 1 1 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 1 1 0]';
J=[0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 0 0 0 1 0 1 1 1 0]';
K=[1 0 0 0 1 1 0 0 1 0 1 0 1 0 0 1 1 0 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1]';
L=[1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1]';
M=[1 0 0 0 1 1 1 0 1 1 1 0 1 0 1 1 0 1 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
N=[1 0 0 0 1 1 0 0 0 1 1 1 0 0 1 1 0 1 0 1 1 0 0 1 1 1 0 0 0 1 1 0 0 0 1]';
O=[0 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 0 1 1 1 0]';
P=[1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0]';
Q=[0 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 1 0 1 1 0 0 1 0 0 1 1 0 1]';
R=[1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1]';
S=[0 1 1 1 0 1 0 0 0 1 1 0 0 0 0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 1 1 1 1 1 1]';
T=[1 1 1 1 1 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0]';
U=[1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 0 1 1 1 0]';
V=[1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0]';
W=[1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 1 0 1 1 0 1 0 1 1 1 0 1 1 1 0 0 0 1]';
X=[1 0 0 0 1 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 1 0 0 0 1]';
Y=[1 0 0 0 1 1 0 0 0 1 0 1 1 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0]';
Z=[1 1 1 1 1 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 1 1 1 1 1]';
% Creación de la matriz de entradas:
x=[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z];
%% Salidas deseadas como VECTORES COLUMNA:
t=[0 0 0 0 0; %A
   0 0 0 0 1; %B
   0 0 0 1 0; %C
   0 0 0 1 1; %D
   0 0 1 0 0; %E
   0 0 1 0 1; %F
   0 0 1 1 0; %G
   0 0 1 1 1; %H
   0 1 0 0 0; %I
   0 1 0 0 1; %J
   0 1 0 1 0; %K
   0 1 0 1 1; %L
   0 1 1 0 0; %M
   0 1 1 0 1; %N
   0 1 1 1 0; %O
   0 1 1 1 1; %P
   1 0 0 0 0; %Q
   1 0 0 0 1; %R
   1 0 0 1 0; %S
   1 0 0 1 1; %T
   1 0 1 0 0; %U
   1 0 1 0 1; %V
   1 0 1 1 0; %W
   1 0 1 1 1; %X
   1 1 0 0 0; %Y
   1 1 0 0 1 %Z
   ]';

% FIN DE LA SECCIÓN DE DATOS
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

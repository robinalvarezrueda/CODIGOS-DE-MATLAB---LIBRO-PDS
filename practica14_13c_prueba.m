%% PRÁCTICA 14-13c: PROGRAMA PARA EMPLEAR EL CONJUNTO DE PRUEBA

clc, close all, clear all

%% Lectura de los pesos ya entrenados
load pesos_W1_W2

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EXTRACCIÓN DE CARACTERÍSTICAS DE PRUEBA:

% % ENTRADAS:
Num_prueba = 10; % 1, 3, 6, 8, 10; % Número de vocales que se emplearán para el ENTRENAMIENTO, 
% Vocal a:
for i=1:1:Num_prueba
    nombre=sprintf('a%d.wav', i);
    [vocal_a{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
% Vocal e:
for i=1:1:Num_prueba
    nombre=sprintf('e%d.wav', i);
    [vocal_e{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
% Vocal i:
for i=1:1:Num_prueba
    nombre=sprintf('i%d.wav', i);
    [vocal_i{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
% Vocal o:
for i=1:1:Num_prueba
    nombre=sprintf('o%d.wav', i);
    [vocal_o{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
% Vocal u:
for i=1:1:Num_prueba
    nombre=sprintf('u%d.wav', i);
    [vocal_u{i},Fs] = audioread([pwd '\Vocales_prueba\', nombre]);
end
 
%% DOMINIO DE LA FRECUENCIA
% Cálculo de los periodogramas:
N = length(vocal_a{1,1});% será lo mismo para las otras vocales
nFFT = 2^ceil(log2(N))*1; % Cálculo de la nFFT
 
for i = 1:1:Num_prueba
    A1 = fft(vocal_a{1,i}, nFFT); % Cálculo de la fft
    P_a1= abs(A1)/max(abs(A1)); % Normalización
    P_a1_norm(:,i) = P_a1(1:nFFT/2+1); % Extracción de la mitad del espectro
 
    E1 = fft(vocal_e{1,i}, nFFT); % Cálculo de la fft
    P_e1 = abs(E1)/max(abs(E1)); % Normalización
    P_e1_norm(:,i) = P_e1(1:nFFT/2+1); % Extracción de la mitad del espectro
 
    I1 = fft(vocal_i{1,i}, nFFT); % Cálculo de la fft
    P_i1 = abs(I1)/max(abs(I1)); % Normalización
    P_i1_norm(:,i) = P_i1(1:nFFT/2+1); % Extracción de la mitad del espectro
 
    O1 = fft(vocal_o{1,i}, nFFT); % Cálculo de la fft
    P_o1 = abs(O1)/max(abs(O1)); % Normalización
    P_o1_norm(:,i) = P_o1(1:nFFT/2+1); % Extracción de la mitad del espectro
 
    U1 = fft(vocal_u{1,i}, nFFT); % Cálculo de la fft
    P_u1 = abs(U1)/max(abs(U1)); % Normalización
    P_u1_norm(:,i) = P_u1(1:nFFT/2+1); % Extracción de la mitad del espectro
end
% Todos los periodogramas normalizados ya están como VECTOR COLUMNA //
% Listo para ingresar a la MLP //
 
x_prueba = [];
% Reunimos las (Num_prueba) vocales "a"
for i = 1:1:Num_prueba
    x_prueba = [x_prueba P_a1_norm(:,i)];
end
%Agregamos los (Num_prueba) vocales "e"
for i = 1:1:Num_prueba
    x_prueba = [x_prueba P_e1_norm(:,i)];
end
%Agregamos los (Num_prueba) vocales "i"
for i = 1:1:Num_prueba
    x_prueba = [x_prueba P_i1_norm(:,i)];
end
%Agregamos los (Num_prueba) vocales "o"
for i = 1:1:Num_prueba
    x_prueba = [x_prueba P_o1_norm(:,i)];
end
%Agregamos los (Num_prueba) vocales "u"
for i = 1:1:Num_prueba
    x_prueba = [x_prueba P_u1_norm(:,i)];
end
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
% CÁLCULO DE LA EXACTITUD DEL SISTEMA DE RECONOCIMIENTO:
Error_vocales_a = abs(Num_prueba-Num_vocales_a);
Error_vocales_e = abs(Num_prueba-Num_vocales_e);
Error_vocales_i = abs(Num_prueba-Num_vocales_i);
Error_vocales_o = abs(Num_prueba-Num_vocales_o);
Error_vocales_u = abs(Num_prueba-Num_vocales_u);
Error_total = Error_vocales_a + Error_vocales_e + Error_vocales_i + Error_vocales_o + Error_vocales_u;

Total = Num_prueba *5;
correctas = Total - Error_total; 
exactitud = (correctas/Total)*100;
disp(['La exactitud del sistema de reconocimiento es: ',num2str(exactitud), '%'])

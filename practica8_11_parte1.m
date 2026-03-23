%% PRÁCTICA 8.11-PARTE 1. Diferenciación entre las vocales pronunciadas por una persona 

clc, close all, clear all; 

clc, close all, clear all
%% Lectura automática de archivos:
%Letras a
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
% Almacenamiento en matrices: 
% una matriz para la "a", otra para la "e",etc...
for j=1:10
   y_a(:,j) = vocal_a{j};
   y_e(:,j) = vocal_e{j};
   y_i(:,j) = vocal_i{j};
   y_o(:,j) = vocal_o{j};
   y_u(:,j) = vocal_u{j};
end
% Gráficas superpuestas en tiempo:
for j=1:10
    figure(1)
    hold on
    plot(y_a(:,j))
    title('vocal "a"')
    legend({'A1','A2','A3','A4','A5','A6','A7','A8','A9','A10'})
    figure(2)
    hold on
    plot(y_e(:,j))
    title('vocal "e"')
    legend({'E1','E2','E3','E4','E5','E6','E7','E8','E9','E10'})
    figure(3)
    hold on
    plot(y_i(:,j))
    title('vocal "i"')
    legend({'I1','I2','I3','I4','I5','I6','I7','I8','I9','I10'})
    figure(4)
    hold on
    plot(y_o(:,j))
    title('vocal "o"')
    legend({'O1','O2','O3','O4','O5','O6','O7','O8','O9','O10'})
    figure(5)
    hold on
    plot(y_u(:,j))
    title('vocal "u"')
    legend({'U1','U2','U3','U4','U5','U6','U7','U8','U9','U10'})
end

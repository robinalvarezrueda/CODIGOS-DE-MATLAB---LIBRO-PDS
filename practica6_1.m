%% PRÁCTICA 6.1. Ortogonalidad de funciones seno.

clc; close all; clear all;
% Definir los valores de m y n
m = 3; % índice de la primera función seno
n = 4; % índice de la segunda función seno
L = pi; % Período T = 2*L.
% Vector de valores x sobre el intervalo [-L, L]
x = linspace(-L, L, 1000);
% Definimos las dos funciones seno
f1 = sin(m * pi * x / L);  % sin(3πx/L)
f2 = sin(n * pi * x / L);  % sin(4πx/L)
% Producto de las dos funciones
producto = f1 .* f2;
% Separar partes positivas y negativas del producto
positivo = producto;
positivo(positivo < 0) = 0;
negativo = producto;
negativo(negativo > 0) = 0;
% Gráfica con áreas coloreadas
figure; hold on;
area(x, positivo, 'FaceColor', 'b', 'EdgeColor', 'none');  % Azul para positivos
area(x, negativo, 'FaceColor', 'r', 'EdgeColor', 'none');  % Rojo para negativos
plot(x, producto, 'k', 'LineWidth', 1.2);                  % Curva en negro
xlabel('x'); ylabel('sin(3\pi x/L) * sin(4\pi x/L)');
title('Producto de sin(3\pi x/L) y sin(4\pi x/L)'); grid on;
f = @(x) sin(m*pi*x/L) .* sin(n*pi*x/L); % Función producto de senos
resultado = integral(f, -L, L); % Cálculo de la integral definida en [-L, L]
disp(['Resultado de la integral: ', num2str(resultado)]); % Mostrar resultado

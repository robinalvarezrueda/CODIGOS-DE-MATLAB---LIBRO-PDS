
%% PRÁCTICA 2.1. Generación básica de una señal sinusoidal 
clc; clear all; close all;
%% Configuración de los parámetros de la onda:
Amax=1; %Amplitud máxima
Fo=1000; %Frecuencia
T=1/Fo; %Período
%Fase incial:
Fase_inicial= pi; % En radianes pues la función seno acepta argumentos en radianes.
%Duración de la onda: solo 2 períodos para poder verificar parámetros
duracion=2*T;

%Período de muestreo o tiempo entre muestras:
Ts=T/100; 
%Vector de tiempos discreto:
tn=0:Ts:duracion;

%% Construcción de la señal -- vector de amplitudes:
yn=Amax*sin(2*pi*Fo*tn + Fase_inicial);

%% Gráfica de la señal 
plot(tn,yn,'ob','MarkerSize',4);
%Etiquetas y título
xlabel('Tiempo');
ylabel('Amplitud');
title('Onda sinusoidal de 1 KHz con una fase inicial de 180°');

%% GENERACION DE SONIDO
%frecuencia de muestreo
Fs=1/Ts;
%Salida de sonido
sound (yn, Fs);

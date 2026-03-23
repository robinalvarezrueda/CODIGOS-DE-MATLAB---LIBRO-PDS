%% PRÁCTICA 8.11-PARTE 1. Diferenciación entre las vocales pronunciadas por una persona 

clc, close all, clear all; 

%% Parte del codigo para Grabar las 50 vocales
for i=1:1:50
%%Ingresar nombre del archivo de audio
%%Ejemplo: a1, a2,.... a10,....e10,....u10
nombre=input('Nombre archivo: ','s'); 
fs=44100; %%Frecuencia de muestro
audio=audiorecorder(fs,16,1); %Creacion de objeto para grabar voz
disp('Tiene 2 segundos para pronunciar una vocal ... ');
recordblocking(audio,2); %Grabacion dura 2 segundos
disp('Fin de la Grabacion');
y=getaudiodata(audio);
%Guardar audio en carpeta BaseDatosVocales
% pwd: identifica el directorio actual:
audiowrite(strcat([pwd '\BaseDatosVocales\', nombre,'.wav']),y,fs);
end

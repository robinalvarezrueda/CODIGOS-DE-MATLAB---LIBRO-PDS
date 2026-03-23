%% PRÁCTICA 14.13. Reconocimiento automático de vocales mediante MLP

clc, close all, clear all
%% Grabación de las 50 vocales:
for i=1:1:50
%%Ingresar nombre del archivo de audio
%%Ejemplo: a1,a2,….a10,….e10,….u10
nombre=input('Nombre archivo: ','s'); 
fs=44100; %%Frecuencia de muestro
audio=audiorecorder(fs,16,1); % Creación de objeto para grabar voz
disp ('Tiene 2 segundos para pronunciar una vocal');
recordblocking(audio,2); % Grabación dura 2 segundos
disp('Fin de la Grabación');
y=getaudiodata(audio);
%Guardar audio en carpeta BaseDatosVocales
audiowrite(strcat([pwd '\Vocales_prueba\', nombre,'.wav']),y,fs);
end

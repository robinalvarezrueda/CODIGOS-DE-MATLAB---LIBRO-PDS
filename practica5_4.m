%% PRÁCTICA 5.4. Suma de señales de audio mediante diezmado.

clc, close all, clear all
% Suma de dos sonidos que tienen la misma Fs:
[y1,fs1]=audioread('pajaros.wav'); %Fs1 = 11025 Hz       
[y2,fs2]=audioread('ovni.wav');      %Fs2 = 44100 Hz       
% EXTRACCIÓN DE UN SOLO CANAL EN EL CASO DE QUE SEA ESTEREO:
[filas1, columnas1]= size(y1);
[filas2, columnas2]= size(y2);
if columnas1==2 
   y1_1 = y1(:,1);
end
if columnas1==1 
   y1_1 = y1;
end
if columnas2==2 
   y2_1 = y2(:,1);
end
if columnas2==1 
   y2_1 = y2;
end
y1_canal1=y1_1;          
y2_canal1=y2_1;         
% Bajar la tasa de muestreo a la Fs mayor:
if fs1>fs2
   Factor = fs1/fs2;
   % Determinación si el factor es entero:
   parte_fracional = Factor - fix(Factor);
   % Aplicar dowsample solo para FACTOR ENTERO:
 if parte_fracional==0
      y1_canal1 = downsample(y1_canal1,Factor); 
    else 
            disp.('FACTOR TIENE QUE SER ENTERO') 
  end
end
 
if fs2>fs1
   Factor = fs2/fs1;
   % Determinación si el factor es entero:
   parte_fracional = Factor - fix(Factor);
   % Aplicar dowsample solo para FACTOR ENTERO:
   if parte_fracional==0
      y2_canal1 = downsample(y2_canal1,Factor);
    else 
          disp.('FACTOR TIENE QUE SER ENTERO')
   end
end
% Añadir ceros a la señal más corta y sumar las señales:
if length(y1_canal1)<length(y2_canal1)
   y1_canal1_ceros=[y1_canal1;zeros(length(y2_canal1)-length(y1_canal1),1)];
   y_suma=y1_canal1_ceros+y2_canal1;
else
   y2_canal1_ceros=[y2_canal1;zeros(length(y1_canal1)-length(y2_canal1),1)];
   y_suma=y2_canal1_ceros+y1_canal1;
end
sound(y_suma, fs1)

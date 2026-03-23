%% PRÁCTICA 13.13. Comparación global de métodos tiempo‑frecuencia

clc, close all, clear all
 
%% 1. Recepción de datos (frecuencia, amplitudes y duraciones) de todas las componentes:
% Los datos siguientes solo deben ser reemplazados según se desee introducir problemas de:
% - Resolución en frecuencia: tonos muy juntos
% - Detección: componentes muy pequeñas relativas a la mayor de 1.
clc, close all, clear all
Fmin1=0; Fmax1=400;
Fmin2=200; Fmax2=600;
Fmin3=300; Fmax3=700;
Fmin4=350; Fmax4=750;
Fmin5=375; Fmax5=775;
Fmin6=385; Fmax6=785;
Duracion=1;
Fs=10*Fmax6;
Ts=1/Fs;
t=Ts:Ts:Duracion;
y1=1*chirp(t,Fmin1,Duracion,Fmax1);
y2=0.5*chirp(t,Fmin2,Duracion,Fmax2);
y3=0.1*chirp(t,Fmin3,Duracion,Fmax3);
y4=0.05*chirp(t,Fmin4,Duracion,Fmax4);
y5=0.025*chirp(t,Fmin5,Duracion,Fmax5);
y6=0.001*chirp(t,Fmin6,Duracion,Fmax6);

xn = y1+y2+y3+y4+y5+y6;
% ==================================================
% %% 3.1 ANÁLISIS EN T-F: el ESPECTROGRAMA
% % Se emplea una ventana BH4T grande (20% -- señal / 15):
% window_RF = rectwin(fix(length(xn)/15));
% noverlap_RF=fix(length(window_RF)/2);
% L_ventana_RF=length(window_RF);
% FACTOR = 32;
% nFFT_ventana_RF=2^(ceil(log2(L_ventana_RF)))*FACTOR;
% %Uso de la función spectrogram SIN PARÁMETROS DE SALIDA:
% figure
% tic
% spectrogram(xn,window_RF,noverlap_RF,nFFT_ventana_RF,Fs,'yaxis');
% title('ESPECTROGRAMA SIN PARÁMETROS DE SALIDA');
% toc % 2.34 seg; 4 SEG PANTALLA

% ==================================================
% %% 3.2 ANÁLISIS EN T-F: Transformada de Wigner-Ville (WVD):
% tic
% [d,f,t] = wvd(xn, Fs);
% figure
% contour(t,f,abs(d));
% title('DIAGRAMA TIEMPO-FRECUENCIA WVD')
% xlabel('t(sec)')
% ylabel('F(Hz)')
% colorbar
% toc %  40 SEG, 85 SEG PANTALLA

% ==================================================
% %% 3.3 ANÁLISIS EN T-F: Transformada de SPWVD:
% tic
% [d, f, t] = wvd(xn,Fs,'smoothedPseudo',hamming(501),rectwin(501), 'NumFrequencyPoints',1024);
% figure
% contour(t,f,abs(d));
% title('DIAGRAMA TIEMPO-FRECUENCIA SPWVD')
% xlabel('t(sec)')
% ylabel('F(Hz)')
% colorbar
% toc % 24. SEG, 20 SEG EN PANTALLA

% ==================================================
% %% 3.4 TRANFORMADA DE GABOR:
% % Para que funcione correctamente, respetar el siguiente procedimiento: 
% inputSignal = xn'; %señal de entrada 
% tic
% F = DGTtool('windowName','Gauss'); % NO HAY EFECTO DE PARÁMETROS, se obtiene mismo resultado
% %F = DGTtool('windowShift',500,'windowLength',1500,'FFTnum',2000,'windowName','Blackman')
% %F = DGTtool('windowShift',noverlap_RF,'windowLength',length(window_RF),'FFTnum',nFFT_ventana_RF,'windowName','Blackman')

% % =============================================================
% X = F(inputSignal);
% % Gráfica del espectrograma. La frecuencia de muestreo se puede omitir: F.plot(x).
% % Nota: Las funciones de trazado se pueden usar directamente después de definir F.
% x = F.pinv(X);% convierte el espectrograma de nuevo en señal
% %Si no se emplea la instrucción anterior, la siguiente instrucción no
% %funcionaría:
% %F.plot(S,Fs);%NO FUNCIONARÍA
% F.plot(x,Fs); % CUIDADO: aquí debe ir x y no el X (como sería lógico), muy raro.
% %F.plotReassign(x,Fs)
% sgtitle('Transformada de Gabor ventana de Gauss');
% toc % 1.62 seg, 2 seg en pantalla

% =============================================================
% %% 3.5 REASIGNADA DE FOURIER:
% tic
% figure
% 
% % Uso de la función CON PARÁMETROS DE SALIDA:
% [P, F, T]=pspectrum(xn,Fs,'FrequencyLimits',[0 1000],'FrequencyResolution',40,'Leakage',0.85,'spectrogram','Reassign',true);
% mesh(T,F,P) % produjo resultados muy buenos
% colormap parula
% title('ESPECTROGRAMA REASIGNADO EN FRECUENCIA')
% xlabel('Tiempo')
% ylabel('F(Hz)')
% view(2)
% toc % 0.52 seg, 1 seg en pantalla

% =========================================
% %% 3.6 ANALISIS en TF:
% % Transformada Sincronizada de Fourier (Fourier-based SynchroSqueezing Transform o FSST)
% % ventana = total / 10 de la longitud de la señal
% tic
% window_F= rectwin(fix(length(xn)/10));
% [d_F, f_F, t_F] = fsst(xn,Fs,window_F);
% figure
% contour(t_F,f_F,abs(d_F));
% title('FSST con longitud de ventana = 10% de la longitud de la señal')
% xlabel('t(sec)')
% ylabel('F(Hz)')
% toc % 1.5 seg, 3 seg en pantalla

% ===========================================================
% %% 3.7.1 MÉTODO T-F con WAVELET MORSE
% tic
% figure
% %función CWT
% %Se obtienen los valores cfs y F2 usados para graficar el resultado.
% 
% % cwt(xn,Fs,'morse'); 
% % title(' CWT (Wavelet Morse), Parámetros por defecto [3,60]');
% 
% cwt(xn,Fs,'morse','WaveletParameters',[12,440]); 
% title(' CWT (Wavelet Morse), [12,440]');
% 
% toc % 1.97 seg, 2 seg en pantalla
% 
% % ===========================================================
% %% 3.7.2 MÉTODO T-F con WAVELET BUMP
% tic
% figure
% %función CWT con tipo de wavelet Bump:
% cwt(xn,Fs,'bump'); 
% title(' CWT (Wavelet bump)');
% toc

% %===========================================================
% %% 3.7.3 MÉTODO T-F con WAVELET MORLET
% tic
% figure
% %función CWT
% cwt(xn,Fs,'amor'); 
% title(' CWT (Wavelet MORLET)');
% toc % 2.067 seg, 3 seg en pantalla

%% ======================================================
% %% 3.8 SUPERLETS ASLT:
% % Uso de la función ASLT:
% % Parametros de entrada
% fois = 1:1:1000;  %vector buffer para el rango del eje de frecuencias 
% srord= [1, 30];   %vector de ciclos para frecuencia (suficientes 40, luego ya no se gana nada)
% 
% tic
% TF_ASLT = aslt(xn, Fs, fois, 5, srord, 0);
% toc % 29.5 seg; 38 seg en pantalla
% 
% figure
% imagesc(t,fois,TF_ASLT);
% set(gca, 'ydir', 'normal');
% colormap jet;
% title('SUPERLETS ASLT');
% xlabel('t(sec)');
% ylabel('F(Hz)');
 
%% =====================================================
% % 3.9 SUPERLETS FASLT:
% % Uso de la función FASLT:
% fois = 1:1:1000;  %vector buffer para el rango del eje de frecuencias 
% srord2= [1, 40];    %vector de ciclos para frecuencia (suficientes 40, luego ya no se gana nada)
% 
% tic
% TF_FASLT = faslt(xn, Fs, fois, 8, srord2, 0);
% toc % 41.12 seg, 42 seg en pantalla
% 
% figure
% imagesc(t,fois,TF_FASLT);
% set(gca, 'ydir', 'normal');
% colormap jet;
% xlabel('TIEMPO (segundos)');
% title('SUPERLETS FASLT');
% xlabel('t(sec)');
% ylabel('F(Hz)');

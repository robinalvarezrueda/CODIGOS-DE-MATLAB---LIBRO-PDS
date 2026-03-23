%% PRÁCTICA 13.5. Análisis tiempo‑frecuencia mediante la transformada de Wigner‑Ville

clc, close all, clear all
 
%% 1. Recepción de datos (frecuencia, amplitudes y duraciones) de todas las componentes:
% Los datos siguientes solo deben ser reemplazados según se desee introducir problemas de:
% - Resolución en frecuencia: tonos muy juntos
% - Detección: componentes muy pequeñas relativas a la mayor de 1.
 
% %1.1 Frecuencias de las componentes (ordenadas de menor a mayor):
%f1=20; f2=30; f3=50; f4=60; f5=80; f6=90;
f1=20; f2=25; f3=50; f4=53; f5=80; f6=81;
% % 1.2 Amplitudes:
a1=1; a2=1; a3=1; a4=1; a5=1; a6=1;
%a1= 1; a2= 0.1; a3= 0.1; a4= 0.05; a5= 0.01; a6=0.005;
% 1.3 Duraciones de las componentes:
t1=[0 3]; t2=[2 4]; t3=[2 3]; t4=[2.5 3.5]; t5=[2 4]; t6=[1 3];
%% 1.2. Generación de la señal compuesta (suma de todas las componentes):
Fs=10*f6; % Fs respecto de la f6 que es la más exigente 
Ts=1/Fs;
duracion = 4; % es el tiempo máximo que ocupan las componentes
t=0:Ts:duracion;
%% MÉTODO 2: aprovechando las ventajas de programación de Matlab,
% se realiza el método anterior pero ahora de manera compacta:
% Primeramente se generan cada una de las componentes en todo el intervalo (4 segundos):
comp1=a1*sin(2*pi*f1*t);
comp2=a2*sin(2*pi*f2*t);
comp3=a3*sin(2*pi*f3*t);
comp4=a4*sin(2*pi*f4*t);
comp5=a5*sin(2*pi*f5*t);
comp6=a6*sin(2*pi*f6*t);
% Se llena de ceros las componentes en los intervalos donde no existen pero se aprovecha
% las posibilidades de Matlab:
comp1=(t<=3).*(comp1);
comp2=((t>=2)&(t<=4)).*(comp2);
comp3=((t>2) & (t<=3)).*(comp3);
comp4=((t>=2.5)&(t<=3.5)).*(comp4);
comp5=((t>=2)&(t<=4)).*(comp5);
comp6=((t>=1)&(t<=3)).*(comp6);
% Presentación de las componentes en forma ascendentes tal como es el
% diagrama TF ideal:
figure
subplot(7,1,1);plot(t,comp6);title('componente 6'); xlabel('t(s)');grid on;
subplot(7,1,2);plot(t,comp5);title('componente 5'); xlabel('t(s)');grid on;
subplot(7,1,3);plot(t,comp4);title('componente 4'); xlabel('t(s)');grid on;
subplot(7,1,4);plot(t,comp3);title('componente 3'); xlabel('t(s)');grid on;
subplot(7,1,5);plot(t,comp2);title('componente 2'); xlabel('t(s)');grid on;
subplot(7,1,6);plot(t,comp1);title('componente 1'); xlabel('t(s)');grid on;
% Una vez generadas las componentes, las sumamos para obtener la señal compuesta:
yt1 = comp1+comp2+comp3+comp4+comp5+comp6;
subplot(7,1,7);plot(t,yt1,'r');title('señal compuesta'); xlabel('t(s)');grid on;
% Visualización del TF ideal en conjunto con la señal compuesta obtenida de
% manera que se vea la existencia de una o varias componentes según los intervalos  
figure
subplot(2,1,1);
hold on
plot (t1,[f1 f1],'linewidth',2)
plot (t2,[f2 f2],'linewidth',2)
plot (t3,[f3 f3],'linewidth',2)
plot (t4,[f4 f4],'linewidth',2)
plot (t5,[f5 f5],'linewidth',2)
plot (t6,[f6 f6],'linewidth',2)
title('DIAGRAMA TIEMPO-FRECUENCIA IDEAL')
xlabel('t(sec)'), ylabel('F(Hz)'), axis([0 6 0 100])
legend('Amp6: 1','Amp5: 1','Amp4: 1','Amp3: 1','Amp2: 1','Amp1: 1')
%legend('Amp6: 1','Amp5: 0.01','Amp4: 0.001','Amp3: 0.001','Amp2: 0.01','Amp1: 1')
subplot(2,1,2);
plot(t,yt1);
title('Señal compuesta en el dominio del tiempo');
xlabel('t(sec)');
ylabel('F(Hz)');
axis([0 6 -10 10]) % mismos limites horizontales que el TF ideal para observar correspondencias
xn = yt1;
%% 2. ANÁLISIS EN FRECUENCIA:
N=length(xn); % numero de muestras de la señal discretizada
FACTOR = 1024;
nFFT=2^(ceil(log2(N)))*FACTOR;
f=linspace(0,Fs,nFFT);
%% 2.1 Periodograma Modificado con BH4T:
window_2=blackmanharris(fix(length(xn)));
xn_enventanada_2 = window_2 .* xn';
PM2 = 20*log10(abs(fft(xn_enventanada_2,nFFT)));
%% 2.2 CORRELOGRAMA MODIFICADO
r1 =xcorr(xn); % CÁLCULO DE LA AUTOCORRELACIÓN
r1 = r1';
% Ventana:
ventana1=bartlett(2*N-1);
% Autocorrelación enventanada:
rw1 = r1.*ventana1;
% TOMAMOS SOLO LA PARTE POSITIVA DE LA AUTOCORRELACIÓN:
rw1=rw1(1:end); 
% APLICAMOS LA FFT A LA AUTOCORRELACIÓN ENVENTANADA:
N_r1=length(rw1);
nFFT_corr=2^(ceil(log2(N_r1)))*FACTOR;
Correlograma1 = abs(fft(rw1, nFFT_corr));
f_corr = linspace(0,Fs,nFFT_corr);
%% 2.3 METODO PARAMETRICO: AR
orden = 400;
[P_yulear,fb]=pyulear(xn,orden,nFFT,Fs);
figure
hold on
plot(f,PM2,'b');
plot(f_corr, 20*log10(Correlograma1),'r');
plot(fb, 20*log10(P_yulear),'k')
legend('PM-BH4T','Correlog. Bartlett','P. yulear orden 500')
title('Comparación de los mejores métodos de estimación espectral')
xlabel ('f(Hz)'), xlim([0 Fs/2]);% Xmin Xmax Ymin Ymax, grid minor
% %% 3.1 ANÁLISIS EN T-F: el ESPECTROGRAMA
% % Se emplea una ventana BH4T grande (20% -- señal / 5):
% tic
% window_RF = blackmanharris(fix(length(xn)/20));
% noverlap_RF=fix(length(window_RF)/2);
% L_ventana_RF=length(window_RF);
% FACTOR = 32;
% nFFT_ventana_RF=2^(ceil(log2(L_ventana_RF)))*FACTOR;
% %Uso de la función spectrogram SIN PARÁMETROS DE SALIDA:
% figure
% spectrogram(xn,window_RF,noverlap_RF,nFFT_ventana_RF,Fs,'yaxis');
% title('ESPECTROGRAMA SIN PARÁMETROS DE SALIDA');
% toc
%% 3.2 ANÁLISIS EN T-F: Transformada de Wigner-Ville (WVD):
tic
[d,f,t] = wvd(xn, Fs);
figure
subplot(2,1,1);
hold on
plot (t1,[f1 f1],'linewidth',2)
plot (t2,[f2 f2],'linewidth',2)
plot (t3,[f3 f3],'linewidth',2)
plot (t4,[f4 f4],'linewidth',2)
plot (t5,[f5 f5],'linewidth',2)
plot (t6,[f6 f6],'linewidth',2)
title('DIAGRAMA TIEMPO-FRECUENCIA IDEAL')
xlabel('t(sec)'), ylabel('F(Hz)'), axis([0 6 0 100])
legend('Amp6: 1','Amp5: 1','Amp4: 1','Amp3: 1','Amp2: 1','Amp1: 1')
% legend('Amp6: 0.005','Amp5: 0.01','Amp4: 0.05','Amp3: 0.1','Amp2: 0.1','Amp1: 1')
subplot(2,1,2);
contour(t,f,abs(d));
title('DIAGRAMA TIEMPO-FRECUENCIA WVD')
xlabel('t(sec)'), ylabel('F(Hz)'), axis([0 6 0 100]), colorbar
toc

%% PRÁCTICA 10.4. Reducción de la variabilidad espectral mediante promediado de periodogramas

clc, close all , clear all;
duracion = 10;
Fmax=280;
Fs=10*Fmax;
t=0:1/Fs: duracion; % Duración 10seg
xn=1*sin(2*pi*100*t)+0.5*sin(2*pi*120*t)+...
  0.3*sin(2*pi*140*t)+0.1*sin(2*pi*160*t)+...
  0.03*sin(2*pi*180*t)+0.03*sin(2*pi*200*t)+...
  0.1*sin(2*pi*220*t)+0.3*sin(2*pi*240*t)+...
  0.5*sin(2*pi*260*t)+1*sin(2*pi*280*t);
xn_noisy = awgn(xn,0,'measured');
subplot(3,1,1)
plot(t,xn_noisy);
title('Señal con ruido AWGN de 0 (dB)'), grid minor
%% Dominio de la frecuencia:
N = length(xn);
FACTOR = 32;
nFFT = 2^ceil(log2(N))*FACTOR;
% PERIODOGRAMA SIMPLE y MODIFICADO:
% 1. GENERACION DE VENTANAS:
window_1=rectwin(length(xn));
window_2=hann(length(xn));
% 2. Enventanado de la senial temporal:
y1_enventanada=xn_noisy.*window_1';
y2_enventanada=xn_noisy.*window_2';
% 3. Periodograma modificado:
Periodograma_Simple=20*log10(abs(fft(y1_enventanada,nFFT)));
Periodograma_Modificado=20*log10(abs(fft(y2_enventanada,nFFT)));
%Eje de frecuencias:
f_periodograma=linspace(0,Fs,nFFT);
%%  METODO DE WELCH: si queremos porciones de un 20%,
% las porciones de datos serán de longitud:
L=fix(length(xn)/5);
% Tiempo de ventana de longitud L:
ventana= hann (L);
% Traslape del 50% (el número de muestras de traslape que debe ser entero):
noverlap = fix(length(ventana)/2);
nFFT_welch = 2^ceil(log2(length(ventana)))*FACTOR;
[P_welch,f_welch] = pwelch(xn_noisy,ventana,noverlap,nFFT_welch,Fs);
Periodograma_Welch = 20*log10(P_welch);
subplot(3,1,2), hold on
plot(f_periodograma,Periodograma_Simple,'k');
plot(f_periodograma,Periodograma_Modificado,'b');
axis([0 Fs/2 min(Periodograma_Simple) max(Periodograma_Simple)]);
xlabel('Frecuencia (Hz)'); legend('Periodograma Simple','Periodograma Modificado')
title('Periodogramas: Simple y Modificado'), grid minor
subplot(3,1,3)
plot(f_welch,Periodograma_Welch,'r');
axis([0 Fs/2 min(Periodograma_Welch) max(Periodograma_Welch)]); xlabel('Frecuencia (Hz)');
title('Método de Welch'), grid minor

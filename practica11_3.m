%% PRÁCTICA 11.2. Implementación del periodograma modificado sin emplear la función de Matlab.

clc, close all , clear all;
% Generación de señal con 10 componentes:
duracion = 0.5;
Fmax=250;
Fs=10*Fmax;
t=0:1/Fs: duracion; % Duración 10seg
xn=1*sin(2*pi*100*t)+1*sin(2*pi*108*t)+...
  0.5*sin(2*pi*120*t)+0.5*sin(2*pi*127*t)+...
  0.1*sin(2*pi*140*t)+0.1*sin(2*pi*146*t)+...
  0.05*sin(2*pi*160*t)+0.05*sin(2*pi*165*t)+...
  0.01*sin(2*pi*180*t)+0.01*sin(2*pi*184*t)+...
  0.005*sin(2*pi*200*t)+0.005*sin(2*pi*203*t)+...
  0.001*sin(2*pi*220*t)+0.001*sin(2*pi*222*t)+...
  0.0005*sin(2*pi*240*t)+0.0005*sin(2*pi*241*t);
% SNR = 25; %10dB
% xn = awgn (xn, SNR, 'measured');

%% Dominio de la frecuencia:
%% PERIODOGRAMA SIMPLE:
N = length(xn);
FACTOR = 128;
nFFT = 2^ceil(log2(N))*FACTOR;
Periodograma=20*log10(abs(fft(xn,nFFT))); % implícita la multiplicación por una ventana rectangular.
f=linspace(0,Fs,nFFT);
%% PERIODOGRAMA MODIFICADO:
% 1. GENERACION DE VENTANAS:
window_2=blackmanharris(length(xn));
% 2. Enventanado de la señal temporal:
y2_enventanada=xn.*window_2';
% 3. Periodograma modificado:
Periodograma_Modificado_2=20*log10(abs(fft(y2_enventanada,nFFT)));
%Eje de frecuencias:
f_periodograma=linspace(0,Fs,nFFT);
hold on
plot(f_periodograma,Periodograma,'b');
plot(f_periodograma,Periodograma_Modificado_2,'r');
xlabel('Frecuencia (Hz)');
legend('P.Simple ','P.BH4T')
title('P. Simple VS P. BH4T ' )
xlim([0 Fs/2]); grid minor

%% METODO MULTITAPER - SLEPIAN:
nw = 2;
[p_mtp_slepian_nw2,f_mtp] = pmtm(xn,nw,nFFT,Fs);
nw = 4;
[p_mtp_slepian_nw4,f_mtp] = pmtm(xn,nw,nFFT,Fs);
% GRAFICAS:
figure, hold on
plot(f_mtp,20*log10(p_mtp_slepian_nw2),'b');
plot(f_mtp,20*log10(p_mtp_slepian_nw4), 'k')
legend('P. Slepian nw=2','P. Slepian nw=4')
title('Multitaper-Slepian nw=2 VERSUS Multitaper-Slepian nw=4')
xlabel ('f(Hz)')
xlim([0 Fs/2]);% Xmin Xmax Ymin Ymax
grid minor
%% METODO MULTITAPER - SINE:
nw = 2;
[p_mtp_sine_nw2,f_mtp] = pmtm(xn,nw,nFFT,Fs,'Tapers','sine');
nw = 4;
[p_mtp_sine_nw4,f_mtp] = pmtm(xn,nw,nFFT,Fs,'Tapers','sine');
figure, hold on
plot(f_mtp,20*log10(p_mtp_sine_nw2),'b');
plot(f_mtp,20*log10(p_mtp_sine_nw4), 'k')
legend('P. Sine nw=2','P. Sine nw=4')
title('Multitaper-Sine nw=2 VERSUS Multitaper-Sine nw=4')
xlabel ('f(Hz)')
xlim([0 Fs/2]);% Xmin Xmax Ymin Ymax
grid minor

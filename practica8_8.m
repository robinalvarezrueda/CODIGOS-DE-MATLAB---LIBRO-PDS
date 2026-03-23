%% PRÁCTICA 8.8. Cálculo del área espectral en bandas de frecuencia seleccionadas

clc,close all,clear all;
duracion =5;
Fmax = 125;
Fs = 100*Fmax;
Ts= 1/ Fs;
%Vector de tiempo
tn = Ts:Ts:duracion;
%Señal
f1=100; 
f2=105;
f3=110;
f4=115;
f5=120;
f6=125;
yn=1*sin(2*pi*f1*tn)+0.8*sin(2*pi*f2*tn)+...
  0.6*sin(2*pi*f3*tn)+0.4*sin(2*pi*f4*tn)+...
  0.2*sin(2*pi*f5*tn)+0.1*sin(2*pi*f6*tn);
%% Calculo del periodograma:
N = length(yn);
nFFT = 2^ceil(log2(N))*128; % Cálculo de nFFT 
y_1 = fft(yn, nFFT); % C?°lculo de los complejos FFT
P1 = abs(y_1)/max(abs(y_1));

% Extracción de la mitad del espectro para evitar problemas con el findpeak.
P = P1(1:nFFT/2+1);
f = Fs*(0:(nFFT/2))/nFFT;
 
% Encontramos los 4 picos máximos del Periodograma:
[picos, ubicacion] = findpeaks(P,'SortStr','descend','NPeaks',4);
F_Peaks = f (ubicacion);
 
% Áreas bajo la curva:
%Primera componente:
P_A1=P(find(f>=F_Peaks(1)-2 & f<=F_Peaks(1)+2));
f_A1=f(find(f>=F_Peaks(1)-2 & f<=F_Peaks(1)+2)); %se usará en el función fill
% Área bajo la curva en el intervalo:
A1_suma=sum(P_A1);
A1_trapz= trapz(P_A1);
%Segunda componente:
P_A2=P(find(f>=F_Peaks(2)-2 & f<=F_Peaks(2)+2));
f_A2=f(find(f>=F_Peaks(2)-2 & f<=F_Peaks(2)+2)); %se usará en el función fill
A2_suma=sum(P_A2);
A2_trapz= trapz(P_A2);
%Tercera componente:
P_A3=P(find(f>=F_Peaks(3)-2 & f<=F_Peaks(3)+2));
f_A3=f(find(f>=F_Peaks(3)-2 & f<=F_Peaks(3)+2)); %se usará en el función fill
A3_suma=sum(P_A3);
A3_trapz= trapz(P_A3);
%Cuarta componente:
P_A4=P(find(f>=F_Peaks(4)-2 & f<=F_Peaks(4)+2));
f_A4=f(find(f>=F_Peaks(4)-2 & f<=F_Peaks(4)+2));
A4_suma=sum(P_A4);
A4_trapz= trapz(P_A4);
%Gráfico Áreas de la señal
figure
plot(f,P)
hold on
fill(f_A1,P_A1,'b',f_A2,P_A2,'g',f_A3,P_A3,'r',f_A4,P_A4,'y')
title('Primeros 4 componentes del espectro')
xlabel('f (Hz)'), ylabel('Amplitud (mV)')
legend('Espectro de la señal','Area 1','Area 2','Area 3','Area 4'), xlim([95 130])

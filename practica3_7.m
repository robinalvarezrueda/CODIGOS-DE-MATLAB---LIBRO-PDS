%% PRÁCTICA 3.7. Recuperación de señales compuestas de múltiples frecuencias.

clc, close all, clear all
% Datos de la señal:
F1=10; % frecuencia de la primera componente  
F2=20; % frecuencia de la segunda componente   
Fmax=F2; % frecuencia máxima 
Fs=2.1*Fmax; %Fs = FACTOR * Fmax
Ts=1/Fs; % Tiempo entre muestras:
%Duración de la señal: 20 muestras
duracion = 20*Ts;
% Vector de tiempo discreto:
tn=0:Ts:duracion; 
% Simulación de la onda "analógica":
% Tiempo entre muestras analógicas mucho menor que Ts:
Ta=Ts/10; 
%Vector de tiempo analógico:
ta=0:Ta:duracion; 
% Simulación de la Señal Analógica:
ya=sin(2*pi*F1*ta) + sin(2*pi*F2*ta);   
% Simulación de la Señal muestreada:
yn= sin(2*pi*F1*tn) + sin(2*pi*F2*tn);   
 
%Gráfico de onda analógica y la muestreada:
subplot(5,1,1)
plot(ta,ya,'g',tn,yn,'o');
%axis([0 duracion -1 1]);
grid on
title('ONDA ANALÓGICA Y MUESTREADA, Fs=FACTOR*Fmax')
 
% SINCS DESPLAZADAS HACIA LAS MUESTRAS:
for n=0:duracion/Ts % Hay 20 muestras
    SINCS_DESPLAZADAS(n+1,:)=sinc((ta-n*Ts)/Ts);
    subplot(5,1,2)
    plot(ta,SINCS_DESPLAZADAS(1:n+1,:));
    pause(0.1)
    title('SINCS DESPLAZADAS HACIA CADA UNA DE LAS MUESTRAS');
end
 
% (SINCS DESPLAZADAS) * (MUESTRAS RESPECTIVAS):
for n=0:duracion/Ts
    SINCS_DESPLAZADAS_POR_MUESTRAS(n+1,:)=yn(n+1)*sinc((ta-n*Ts)/Ts);
    subplot(5,1,3)
    plot(ta,SINCS_DESPLAZADAS_POR_MUESTRAS(1:n+1,:),tn(1:n+1),yn(1:n+1),'o');
    pause(0.1)
    title('CADA UNA DE LAS MUESTRAS MULTIPLICADAS POR SUS RESPECTIVAS SINCS')
end
 
% SEÑAL RECONSTRUIDA: 
%Senial_reconstruida = sum(SINCS_DESPLAZADAS_POR_MUESTRAS);
for n=0:duracion/Ts
    subplot(5,1,4)
    Senial_reconstruida = sum(SINCS_DESPLAZADAS_POR_MUESTRAS(1:n+1,:));
    plot(ta,Senial_reconstruida,'k')
    title('ONDA RECUPERADA AL IR SUMANDO LOS APORTES')
    pause(0.1)
end
    
% COMPARACIÓN ENTRE LA SEÑAL ORIGINAL Y LA RECUPERADA:
subplot(5,1,5)
hold on
plot(ta,ya,'k');
plot(ta,Senial_reconstruida,'b');
legend('Onda Original','Onda Recuperada');
title('Recuperación de la onda con Fs=FACTOR*Fmax');
 

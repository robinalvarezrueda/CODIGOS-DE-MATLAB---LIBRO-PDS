%% PRÁCTICA 6.18. Efecto del período sobre el espectro de amplitudes

%VARIACIÓN DEL PERÍODO DEL PULSO T=2, 10, 20 y 500
clc, clear all, close all
%-----GENERACIÓN DE TREN DE PULSOS------------
%VARIABLES PARA PULSOS
T_pulso =2;                                  %Período del pulso
tiempo = -T_pulso:0.01:T_pulso; %Vector de tiempo de pulso
vector_pulso = [];                         %Vector almacenamiento de un pulso                       
Pulso_total = [];                            %Vector almacenamiento de un tren de pulso
Long = length(tiempo);                 %Longitud del vector tiempo
%GENERACIÓN DEL TREN DE PULSOS 
for k=1:100                                 %Longitud del tren de pulsos                          
%Creación de un pulso 
 for j=1:Long
    if tiempo(j)<-1
        vector_pulso(j) = 0;
    end
    if tiempo(j)>-1 & tiempo(j)<1
        vector_pulso(j) = 1;
    end
     if tiempo(j)>1
        vector_pulso(j) = 0;
    end 
 end
Pulso_total = [Pulso_total vector_pulso]; %Almacenamiento de pulso generados 
end
%--------ESPECTRO DE AMPLITUDES--------------
%VARIABLES PARA ESPECTRO DE AMPLITUDES
Freq =100;                                %Frecuencia de trabajo 
F_s=2*Freq*T_pulso;                %Frecuencia de muestreo
T_s= 1/F_s;                               %Período de muestreo
duracion=1;                               %Duración de cada componente (Cn)
t_n=-duracion:T_s:duracion;     %Vector de duración Cn
p=1;                                           %Valor de p=1
%GENERACIÓN DE COEFICIENTES DE LA SERIE COMPLEJA DE FOURIER
C_n=((p/T_s)*sinc(t_n*2*pi*Freq*p/2))/F_s;  %Expresión para generación de Cn
C_n=abs(C_n)
figure
%GRAFICACIÓN DE LA SEÑAL DISCRETA
subplot(2,1,1) 
plot(Pulso_total,'LineWidth',1.5)        %Gráfica de la señal discreta
axis([0 15000 -0.5 1.5]), xlabel('Tiempo(seg)'), ylabel('Amplitud'), title('Pulso rectangular')                    
legend('Período T= 2'), grid minor 
%GRAFICACIÓN DEL ESPECTRO DE AMPLITUDES
subplot(2,1,2)
stem(t_n,C_n,'g','LineWidth',1.5)                %Gráfica del espectro de amplitudes
axis([-0.02 0.02 -0.5 1.5])                      
xlabel('Frecuencia(Hz)'), ylabel('Amplitud'),title('Espectro de amplitudes')                  
legend('Período T= 2'), grid minor

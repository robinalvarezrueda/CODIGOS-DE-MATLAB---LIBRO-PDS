%% PRÁCTICA 6.8. Serie de Fourier compleja de una onda cuadrada

% Obtención del módulo de Cn (espectro de amplitudes):
clc, clear all, close all
num=input('ingrese número de componentes de frecuencia a considerar: ');
f=-num:1:num; % Eje de frecuencia
Ymax=1; % Amplitud de la señal
% Obtencion de los coeficientes complejos de Fourier (Cn)
Cn=zeros(1,length(f));
for n=-num:1:num;
    if n==0;
        Cn(num+n+1)=0;
    else
        Cn(num+n+1)=((-j*Ymax)/(n*pi))*(1-(-1)^n); % FÓRMULA FINAL DE Cn ENCONTRADA
    end
end
modulo=abs(Cn); % Módulo de los complejos (Espectro de amplitudes)
modulo_normalizado = modulo/max(modulo);
stem(f,modulo_normalizado,'r','filled')
grid on, 
title('Espectro de Amplitud para la señal cuadrada')
xlabel('EJE DE FRECUENCIAS'), 
ylabel('|Cn|'), 
xlim([0 num])

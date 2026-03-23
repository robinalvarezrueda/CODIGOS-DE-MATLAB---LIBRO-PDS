%% PRÁCTICA 5.8. Implementación propia de la correlación cruzada.

clc,clear all,close all
%% Implementación de la Correlación Cruzada:
x = [2 5 0 4]; % secuencia 1
h = [4 1 3 0]; % secuencia 2
Lx = length(x); % longitud de la secuencia 1
Lh = length(h); % longitud de la secuencia 2
y = fliplr(h); % inversión de la secuencia 2
%% Usando función propia de Matlab (xcorr):
z = xcorr(x,h);
disp('Correlación cruzada usando la función por defecto de matlab z[n]')
disp(z)
%% Implementación propia: correlación cruzada usando lazo 'for'
len=Lx+Lh-1;
for n=1:len
    corr(n)=0;
    for k=1:Lx
        if((n-k)>=0 && (n-k)<Lh)
            corr(n)=corr(n)+x(k).*y(n-k+1);
        end
    end
end
disp('Nuestra correlación cruzada implementada es')
disp(corr)
subplot(2, 2, 1)
stem(x)
title('Primera secuencia x[n]')
xlabel('Muestras'), ylabel('Amplitud'), grid minor
subplot(2, 2, 2)
stem(h)
title('Segunda secuencia h[n]')
xlabel('Muestras'), ylabel('Amplitud'), grid minor
subplot(2, 2, 3)
stem(z)
title('Correlación cruzada Rxy[n] - implementada')
xlabel('Muestras'), ylabel('Amplitud'), grid minor
subplot(2,2,4)
stem(z)
title('Correlación cruzada Rxy[n] empleando xcorr de Matlab')
xlabel('Muestras'), ylabel('Amplitud'), grid minor

%% PRÁCTICA 14.8 Clasificación de datos no linealmente separables.

clc, close all;
% Datos:
% x = [1   -0.8  -1.4  0.9 1.3 0.5 0.1 1.3 1.2;-1.4 -0.7  2.3  -2.2 1.5 0.4 0.4 1.2 0.8];
% t = [0    0    0     0   1   1   1   1   1   ]; % salidas deseadas
x = [0   -0.8  -0.1  0.8 0.9 0.4 0.8 0.1 0.7;...
    -0.8 -0.8  1.6  -1.6 0.9 0.6 0.9 0.4 0.8 ] 
t = [0    0    0     0   1   1   1   1   1   ]; % salidas deseadas
w= rand(1,2); % pesos creados aleatoriamente
b= rand; % bias creado aleatoriamente

plot(x(1,1:4),x(2,1:4),'*');hold on
plot(x(1,5:9),x(2,5:9),'+');hold on
axis([-3 3 -3 3]);hold
X=[-1.5:.5:1.5];
Y=(-b-w(1)*X)./w(2); % ecuación de la frontera de decisión
plot(X,Y);hold;
title('Frontera de decisión inicial')  
legend('Datos1','Datos2','Frontera')
grid on

% Creación del objeto VideoWriter:
video_evolucion = VideoWriter('frontera2D');
video_evolucion.FrameRate = 1;
open(video_evolucion);

% Probar con 40 épocas o iteraciones a ver si converge
figure
for j=1:40.
    y=paso(w*x+b);
    if all(t==y) 
        break, end    
        w=w+(t-y)*x';
        b=b+(t-y)*ones(length(x),1);
        plot(x(1,1:4),x(2,1:4),'*');hold on
        plot(x(1,5:9),x(2,5:9),'+');hold on
        axis([-3 3 -3 3]);hold on
        X=[-3:.5:3];
        Y=(-b-w(1)*X)./w(2);
        plot(X,Y);hold;
        title('Evolución de la frontera de decisión')  
      legend('Datos1','Datos2','Frontera')
       grid on
        M = getframe(gcf); % obtiene un frame desde cada figura
        writeVideo(video_evolucion,M); % guarda el frame en el objeto creado
end
if j==40
    fprintf('Solución no encontrada. \n')
else
    fprintf('Solución encontrada en %i epocas.\n',j) 
end
y=paso(w*x+b)
close(video_evolucion)

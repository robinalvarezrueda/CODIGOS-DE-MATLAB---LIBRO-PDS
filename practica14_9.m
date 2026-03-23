%% PRÁCTICA 14.9 Clasificación lineal en tres dimensiones.

clc, close all, clear all
% Datos:
x = [0   -0.3 -0.4  0.3 0.3 0.4 0.2 0.3 0.8; ...
    -0.4 -0.2  1.3 -1.3 0.5 0.3 0.5 .2 0.4;
    -0.4 -0.2  1.3 -1.3 0.5 0.3 0.5 .2 0.4]; 
t =[ 0    0    0    0   1   1   1   1  1  ]; % salidas deseadas
w= rand(1,3); % pesos creados aleatoriamente
b= rand; % bias creado aleatoriamente
%  Gráfico de los puntos en 3D:
plot3(x(1,1:4),x(2,1:4),x(3,1:4),'*');hold on
plot3(x(1,5:9),x(2,5:9),x(3,5:9),'+');hold on
axis([-1.5 1.5 -1.5 1.5 -1.5 1.5]);hold on

[X,Y]=meshgrid(-1.5:.5:1.5);
Z=(-b-w(1)*X-w(2)*Y)./w(3);
surf(X,Y,Z);hold;
title('Frontera de decisión original')  
video_evolucion = VideoWriter('Frontera3D'); %  Creación del objeto VideoWriter
video_evolucion.FrameRate = 1;
open(video_evolucion);
figure
for j=1:30 %  Probar con 30 épocas o iteraciones a ver si converge.
    y=paso(w*x+b);
    if all(t==y) break, end    
        w=w+(t-y)*x';
        b=b+(t-y)*ones(length(x),1);
        plot3(x(1,1:4),x(2,1:4),x(3,1:4),'*');hold on
        plot3(x(1,5:9),x(2,5:9),x(3,5:9),'+');hold on
        axis([-1.5 1.5 -1.5 1.5 -1.5 1.5]);hold on
        [X,Y]=meshgrid(-1.5:.5:1.5);
        Z=(-b-w(1)*X-w(2)*Y)./w(3);
        surf(X,Y,Z);hold;
        title('Evolución de la frontera de decisión')  
        M = getframe(gcf);
        writeVideo(video_evolucion,M);
end
if j==40
    fprintf('Solución no encontrada.\n')
else
      fprintf('Solución encontrada en %i epocas.\n',j) 
end
y=paso(w*x+b);
close(video_evolucion)

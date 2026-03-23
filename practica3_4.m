%% PRÁCTICA 3.4. Implementación y análisis de la función sinc.
% Implementación de la función sinc(t)
% Vector de tiempo discreto:
t = -30:0.1:30;
% OPCIÓN 1: Con la función directa de Matlab
y1 = sinc(t);
% OPCIÓN 2: Implementación manual de la fórmula
y2 = sin(pi*t)./(pi*t);
y2(t == 0) = 1; % Para evitar división por cero
% Gráfica de las señales
figure()
subplot(3,1,1)
stem(t, y1, 'Color', 'red', 'LineStyle', ':')
title('Sinc mediante función directa')
xlim([-10 10])
subplot(3,1,2)
stem(t, y2, 'LineStyle', ':')
title('Sinc mediante función matemática')
xlim([-10 10])
subplot(3,1,3)
stem(t, y1, 'Color', 'yellow', 'LineStyle', '--')
hold on
stem(t, y2, 'Color', 'red', 'LineStyle', ':', 'LineWidth',1)
title('Señales sobrepuestas')
xlim([-10 10])

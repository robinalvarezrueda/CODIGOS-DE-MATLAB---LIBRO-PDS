function [y_normalizacion_estadistica] = normalizacion_estadistica (x)
[n_filas, n_columnas]=size(x);
promedio = mean(x); % cálculo del promedio (tendencia central)
y = x -ones(n_filas,1)* promedio; % se retira la tendencia central
desviacion_estandar= std(y);% cálculo la desviación estándar 
y_normalizacion_estadistica = y ./ (ones(n_filas,1)* desviacion_estandar); % normalización estadística

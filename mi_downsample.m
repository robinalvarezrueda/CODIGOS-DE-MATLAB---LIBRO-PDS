%% PRÁCTICA 5.3. Implementación de una función propia de diezmado
% Creación de la funcion mydownsample
function y_downsample = mi_downsample(senial, factor)
    i = 1;
    for n = 1:factor:length(senial)
        y_downsamplef(i) = senial(n);  
        i = i + 1;
    end
    y_downsample = y_downsamplef';
end

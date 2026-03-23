%% FUNCIÓN PROPIA PARA Ventana de Hann:

function [w]=mi_hann(n)
    k=1:1:n;
    w(k)=(0.5)*(1-cos(2*pi*(k/(n-1))));
    w=w';
end

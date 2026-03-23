function [Xk] = dft_for(xn)  
% N: es la longitud de las muestras de un período de la señal periódica 
% x(n): muestras de la señal periódica de un período N.
N=length(xn);
%Cálculo de la DTF: 
for k=1:N
    sum=0; %sum es la variable que almacenara el valor de cada coeficiente  x(k)
    %Lazo for para calcular cada uno de los coeficientes x(K) de la serie
    for n=0:(N-1)
        sum=sum+xn(n+1)*exp(-j*2*pi*k*n/N);
    end
    %Vector que contiene los coeficientes Ck de la DFT:
    Xk(k)=sum;
end

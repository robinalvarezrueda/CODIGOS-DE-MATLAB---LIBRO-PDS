function [Xk] = dft_vectorial (xn)   
% N: es la longitud de las muestras de un periodo de la señal periódica 
N=length(xn);
WN= exp(-j*2*pi/N); % notación de la exponencial compleja.

n= [0:1:N-1];       % vector fila para n
k= [0:1:N-1];       % vector fila para k
nk= n'*k;           % creación de una matriz NxN de nk valores
WNnk = WN .^nk;      % matriz DFS
Xk = xn * WNnk;     % Vector fila con los Coeficientes DFS: xn debe ser vector FILA

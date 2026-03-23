function out = mi_fft (inp, N)
% Cálculo de los N/2 factores de giro:
fgiro = zeros(1,N/2); % Se crea un vector para almacenar los factores de Giro
periodo = N/2; % Periodo 
for k=1:N/2
    fgiro(k) = exp(-1j*2*pi*(k-1)/N); % factor de giro para N/2 muestras 
end
 
% Una DFT de tamaño N está en función de las dos mitades anteriores:
mitad1 = [inp(1:N/2),inp(1:N/2)]; % primera mitad (muestras pares)
mitad2 = [inp(N/2+1:N),inp(N/2+1:N)]; % la otra mitad (muestras impares)
	
% Cálculo de la salida:
out = zeros(1,N); % crea un vector de ceros de dimensión N
for i=1:N/2
    out(i) = mitad1(i) + fgiro(i)*mitad2(i); %Se calcula el primer coeficiente de la DFT
    out(i+periodo)=mitad1(i) - fgiro(i)*mitad2(i); 
% Se suma el periodo de la señal y se cambia el signo del factor de giro 
end
end

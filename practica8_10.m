%% PRÁCTICA 8.10. Central telefónica digital

%  La frecuencia de muestreo (fs) para señal de 8000 [Hz].	
precision = 20e-3;
% Frecuencia de Muestreo
fs = 8000; %Voz teléfono
% Crear un objeto con parámetros: fs, 16 bits, 1 canal (de los 2 posibles)
y = audiorecorder(fs,16,1);%Creación del objeto para obtención de señal

% Contadores
aux1 = 0;  % Ocupado en los vectores tiempo t y senial_final
aux2 = 0; % Ocupado para mover el eje y simular a un osciloscopio
aux3 = 0; % Ocupado en el auxiliar que ayuda a crear el vector de tiempo
% Barrido de la curva-simulación de mov
ta = precision*1; 
% Tamanio del eje 'x' 3 [ms]
duracion = precision;
% Factor NFFT
Factor = 64;


x=0; %se detenga mediante programa
while x==0   % Inicia (x=0)
    drawnow() %editar plot al instante
    
% Uso del objeto: adquiere senial en bloques de "duracion" en segundos:
    recordblocking(y, precision); 
    % GETAUDIODATA: recupera la señal almacenada:
    senial=getaudiodata(y, 'single');
    % Obtención de tamañoo de señal
    L = length(senial);
    % Almacenamiento de la señal total
    senial_final(aux1+1:aux1+L) = senial;
% Variable auxiliar que ayuda a extedender el tamaño del vector tiempo
    aux = linspace(aux3,aux3+duracion,L);
    % Creación del vector tiempo
    t(aux1+1:aux1+L) = aux;
%---------------------------------------------------------------------
% Configuraciones Graficas
    figure(1)
    p = plot(t,senial_final,'b')
    grid minor;
    set(p,'linewidth',2)            % Grosor de la linea
    set(gca,'FontWeight','bold') % Negrita en las etiquetas de los ejes
    axis([aux2 aux2+duracion min(senial_final)*2 max(senial_final)*2 ]) 
     % Eje x en movimiento
%----------------------------------------------------------
% Dominio de la frecuencia:
    N = length(senial);
    nFFT = 2^ceil(log2(N))*Factor; % Cálculo de nFFT 
    Y = fft(senial, nFFT); % Cálculo de los complejos FFT
    P1 = abs(Y); %Para imprimir la magnitud o periodograma
    P = P1(1:nFFT/2+1);
    f = fs*(0:(nFFT/2))/nFFT;


figure(2)
    q = plot(f,P,'r');
    grid minor;
    set(q,'linewidth',1.2)            % Grosor de la linea
    set(gca,'FontWeight','bold')    % Negrita en las etiquetas de los ejes
    axis([0 2e3 0 max(P)])

       % Numero de Picos
    NF = 2;
    % n Picos y sus correspondientes frecuencias:
    [picos, localizaciones] = findpeaks(P,'SortStr','descend','NPeaks',NF);
    Frecuencias = f(localizaciones);
    Tecla = localizacion(Frecuencias)
    if Tecla ~ 0;
        fprintf('Se ha presionado la Tecla: %s. \n',Tecla);
    end
end
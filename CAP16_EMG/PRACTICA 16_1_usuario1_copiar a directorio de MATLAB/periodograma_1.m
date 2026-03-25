function [P1,P2,P3,P4,P5,P6,P7,P8]=periodograma_1(c1,c2,c3,c4,c5,c6,c7,c8)
% Esta función de MATLAB calcula la transformada discreta de Fourier (DFT) 
% de cada canal usando un algoritmo de transformada rápida de Fourier (fft)
% para 256 puntos.
    g1= c1;
    g2= c2;
    g3= c3;
    g4= c4;
    g5= c5;
    g6= c6;
    g7= c7;
    g8= c8;

    Nn=length(g1);
    nFFTn=2;
    while nFFTn<Nn
        nFFTn=256*nFFTn;
    end
    P1=(abs(fft(g1,nFFTn)));
%--------------------------------------------------------------------------
    Nn2=length(g2);
    nFFTn2=2;
    while nFFTn2<Nn2
        nFFTn2=256*nFFTn2;
    end
    P2=(abs(fft(g2,nFFTn2)));
%--------------------------------------------------------------------------
    Nn3=length(g3);
    nFFTn3=2;
    while nFFTn3<Nn3
        nFFTn3=256*nFFTn3;
    end
    P3=(abs(fft(g3,nFFTn3)));
%--------------------------------------------------------------------------
    Nn4=length(g4);
    nFFTn4=2;
    while nFFTn4<Nn4
        nFFTn4=256*nFFTn4;
    end
    P4=(abs(fft(g4,nFFTn4)));
%--------------------------------------------------------------------------
    Nn5=length(g5);
    nFFTn5=2;
    while nFFTn5<Nn5
        nFFTn5=256*nFFTn5;
    end
    P5=(abs(fft(g5,nFFTn5)));
%--------------------------------------------------------------------------
    Nn6=length(g6);
    nFFTn6=2;
    while nFFTn6<Nn6
        nFFTn6=256*nFFTn6;
    end
    P6=(abs(fft(g6,nFFTn6)));
%-------------------------------------------------------------------------- 
    Nn7=length(g7);
    nFFTn7=2;
    while nFFTn7<Nn7
        nFFTn7=256*nFFTn7;
    end
    P7=(abs(fft(g7,nFFTn7)));
%-------------------------------------------------------------------------- 
    Nn8=length(g8);
    nFFTn8=2;
    while nFFTn8<Nn8
        nFFTn8=256*nFFTn8;
    end
    P8=(abs(fft(g8,nFFTn8)));
end


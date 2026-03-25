function [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5] = filtrado_5_senial_1(c1,c2,c3,c4,c5,c6,c7,c8) 
Fs= 200;
Fmax = Fs/2;
f1=[0  3  5 Fmax]/(Fmax); 
m1=[0  0  1   1  ];

% FILTRO FIR (REMEZ): 
orden_FIR=100;
b2 = remez(orden_FIR, f1, m1); 

%% Obtención de la señal filtrada usando FILTER:
c1_filt_5=filter(b2,1,c1);
c2_filt_5=filter(b2,1,c2);
c3_filt_5=filter(b2,1,c3);
c4_filt_5=filter(b2,1,c4);
c5_filt_5=filter(b2,1,c5);
c6_filt_5=filter(b2,1,c6);
c7_filt_5=filter(b2,1,c7);
c8_filt_5=filter(b2,1,c8);
end

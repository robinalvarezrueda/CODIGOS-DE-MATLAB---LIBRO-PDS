function [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8] = envolvente_senial_1(c1,c2,c3,c4,c5,c6,c7,c8)

  gest1 = c1;
  gest2 = c2;
  gest3 = c3;
  gest4 = c4;
  gest5 = c5;
  gest6 = c6;
  gest7 = c7;
  gest8 = c8;
  
% ENVOLVENTE DE CANAL 1
    df1=envelope(gest1,3,'peak'); % instrucción para hallar la envolvente de la señal EMG del canal 1, con método por interpolación por splines cúbicos
    ab1=[0.1;df1(find(df1>0))]; %  eliminación de valores de la envolvente que sean menores a 0
    ba1=[0.1;ab1(find(ab1<1.2))]; %  eliminación de valores de la envolvente que sean mayores a 1.2
% ENVOLVENTE DE CANAL 2   
    df2=envelope(gest2,3,'peak'); % instrucción para hallar la envolvente de la señal EMG del canal 2, con método por interpolación por splines cúbicos
    ab2=[0.1;df2(find(df2>0))];
    ba2=[0.1;ab2(find(ab2<1.2))];
% ENVOLVENTE DE CANAL 3
    df3=envelope(gest3,3,'peak'); % instrucción para hallar la envolvente de la señal EMG del canal 3, con método por interpolación por splines cúbicos
    ab3=[0.1;df3(find(df3>0))];
    ba3=[0.1;ab3(find(ab3<1.2))];
% ENVOLVENTE DE CANAL 4
    df4=envelope(gest4,3,'peak'); % instrucción para hallar la envolvente de la señal EMG del canal 4, con método por interpolación por splines cúbicos
    ab4=[0.1;df4(find(df4>0))];
    ba4=[0.1;ab4(find(ab4<1.2))];
% ENVOLVENTE DE CANAL 5
    df5=envelope(gest5,3,'peak'); % instrucción para hallar la envolvente de la señal EMG del canal 5, con método por interpolación por splines cúbicos
    ab5=[0.1;df5(find(df5>0))];
    ba5=[0.1;ab5(find(ab5<1.2))];
% ENVOLVENTE DE CANAL 6
    df6=envelope(gest6,3,'peak'); % instrucción para hallar la envolvente de la señal EMG del canal 6, con método por interpolación por splines cúbicos
    ab6=[0.1;df6(find(df6>0))];
    ba6=[0.1;ab6(find(ab6<1.2))];
% ENVOLVENTE DE CANAL 7
    df7=envelope(gest7,3,'peak'); % instrucción para hallar la envolvente de la señal EMG del canal 7, con método por interpolación por splines cúbicos
    ab7=[0.1;df7(find(df7>0))];
    ba7=[0.1;ab7(find(ab7<1.2))];
% ENVOLVENTE DE CANAL 8
    df8=envelope(gest8,3,'peak'); % instrucción para hallar la envolvente de la señal EMG del canal 8, con método por interpolación por splines cúbicos
    ab8=[0.1;df8(find(df8>0))];
    ba8=[0.1;ab8(find(ab8<1.2))];

end


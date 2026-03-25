function [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8] = igualacion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8)
    valor=140;
    ge1=[c1;zeros(valor-length(c1),1)]; 
    ge2=[c2;zeros(valor-length(c2),1)];
    ge3=[c3;zeros(valor-length(c3),1)];
    ge4=[c4;zeros(valor-length(c4),1)];
    ge5=[c5;zeros(valor-length(c5),1)];
    ge6=[c6;zeros(valor-length(c6),1)];
    ge7=[c7;zeros(valor-length(c7),1)];
    ge8=[c8;zeros(valor-length(c8),1)];
    
    ges1=abs(ge1(1:140));
    ges2=abs(ge2(1:140));
    ges3=abs(ge3(1:140));
    ges4=abs(ge4(1:140)); 
    ges5=abs(ge5(1:140));
    ges6=abs(ge6(1:140));
    ges7=abs(ge7(1:140));
    ges8=abs(ge8(1:140));
end


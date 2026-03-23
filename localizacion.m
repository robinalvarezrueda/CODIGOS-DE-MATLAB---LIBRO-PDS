function boton = localizacion(picos)
% Recibe los picos de frecuencia y detecta la tecla presionada
 
% Numero de Picos
NF = 2;
error = 5;
f_inferior = min(picos);
f_superior = max(picos);
for i = 1:NF;
   
    if f_inferior >= 697-error && f_inferior <= 697+error
        
        if f_superior >= 1209-error && f_superior <= 1209+error
            boton = '1';
        end
        
        if f_superior >= 1336-error && f_superior <= 1336+error
            boton = '2';
        end
        
        if f_superior >= 1477-error && f_superior <= 1477+error
            boton = '3';
        end
        
        if f_superior >= 1633-error && f_superior <= 1633+error
            boton = 'A';
        end
        
    elseif f_inferior >= 770-error && f_inferior <= 770+error
        
        if f_superior >= 1209-error && f_superior <= 1209+error
            boton = '4';
        end
        
        if f_superior >= 1336-error && f_superior <= 1336+error
            boton = '5';
        end
        
        if f_superior >= 1477-error && f_superior <= 1477+error
            boton = '6';
        end
        
        if f_superior >= 1633-error && f_superior <= 1633+error
            boton = 'B';
        end
        
    elseif f_inferior >= 852-error && f_inferior <= 852+error
        
        if f_superior >= 1209-error && f_superior <= 1209+error
            boton = '7';
        end
        
        if f_superior >= 1336-error && f_superior <= 1336+error
            boton = '8';
        end
        
        if f_superior >= 1477-error && f_superior <= 1477+error
            boton = '9';
        end
        
        if f_superior >= 1633-error && f_superior <= 1633+error
            boton = 'C';
        end
        
    elseif f_inferior >= 941-error && f_inferior <= 941+error
        
        if f_superior >= 1209-error && f_superior <= 1209+error
            boton = '*';
        end
        
        if f_superior >= 1336-error && f_superior <= 1336+error
            boton = '0';
        end
        
        if f_superior >= 1477-error && f_superior <= 1477+error
            boton = '#';
        end
        
        if f_superior >= 1633-error && f_superior <= 1633+error
            boton = 'D';
        end
    else
        boton = 0;
    end
end
end

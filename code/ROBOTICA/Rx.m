function R=Rx(theta)
dato=whos('theta');
 if strcmp(dato.class, 'sym')%para variables simbólicas
R=simplify([1, 0,  0;
              0,   cos(theta),  -sin(theta);
               0,      sin(theta),    cos(theta)]);                
 else %cálculos numéricos
     digits(3);
     R=([ 1, 0, 0;
                  0, cos(theta),  -sin(theta);
                   0,      sin(theta),    cos(theta)]);
 end
end
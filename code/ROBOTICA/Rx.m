function R=Rx(theta)
dato=whos('theta');
 if strcmp(dato.class, 'sym')%para variables simb�licas
R=simplify([1, 0,  0;
              0,   cos(theta),  -sin(theta);
               0,      sin(theta),    cos(theta)]);                
 else %c�lculos num�ricos
     digits(3);
     R=([ 1, 0, 0;
                  0, cos(theta),  -sin(theta);
                   0,      sin(theta),    cos(theta)]);
 end
end
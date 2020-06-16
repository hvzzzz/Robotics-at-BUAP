function R=Ry(theta)
dato=whos('theta');
 if strcmp(dato.class, 'sym')%para variables simb�licas
R=simplify([cos(theta), 0,  sin(theta);
              0,   1,  0;
                -sin(theta),      0,    cos(theta)]);                
 else %c�lculos num�ricos
     digits(3);
     R=([ double(cos(theta)), 0,  sin(theta);
                           0, 1,  0;
                             -sin(theta),      0,    cos(theta)]);
 end
end
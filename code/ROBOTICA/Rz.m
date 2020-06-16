function R=Rz(theta)
dato=whos('theta');
 if strcmp(dato.class, 'sym')%para variables simb�licas
R=simplify([cos(theta), -sin(theta),  0;
            sin(theta),  cos(theta),  0;
                0,      0,    1]);                
 else %c�lculos num�ricos
     digits(3);
     R=([ double(cos(theta)), double(-sin(theta)),  0;
                  double(sin(theta)), double(cos(theta)),  0;
                             0,      0,    1]);
 end
end
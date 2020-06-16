function RHz=HRz(theta)
dato=whos('theta');
 if strcmp(dato.class, 'sym') %variables simb�licas
   RHz=[cos(theta), -sin(theta),  0,  0;
 sin(theta),  cos(theta),  0,  0;
       0,      0,      1,  0;
       0,      0,      0,  1];                
 else
      digits(3); %c�lculos num�ricos
     RHz=round([ vpa(cos(theta),3),  vpa(-sin(theta),3),  0,  0;
                   vpa(sin(theta),3),  vpa(cos(theta),3),  0,  0;
                     0,      0,      1,  0;
                     0,      0,      0,  1]);          
 end
end

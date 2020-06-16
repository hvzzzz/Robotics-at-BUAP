function RHy=HRy(theta)
dato=whos('theta');
if strcmp(dato.class, 'sym') %variables simb�licas
RHy=[cos(theta),  0,  sin(theta),  0;
    0,  1,  0,  0;
     -sin(theta),      0,      cos(theta),  0;
      0,      0,      0,  1];     
else
 digits(3); %c�lculos num�ricos
     RHy=round([ vpa(cos(theta),3), 0,  vpa(sin(theta),3), 0;
        0,    1,    0,     0;
        vpa(-sin(theta),3), 0,     vpa(cos(theta),3),  0;
     0,      0,      0,  1]);
end
end

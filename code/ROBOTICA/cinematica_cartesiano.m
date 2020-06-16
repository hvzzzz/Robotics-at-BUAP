function [x0, y0, z0]=cinematica_cartesiano(d3,d2,d1)
dato1=whos('d1'); dato2=whos('d2'); dato3=whos('d3');
v1=strcmp(dato1.class, 'sym'); v2=strcmp(dato2.class, 'sym');
v3=strcmp(dato3.class, 'sym'); digits(3);

  if (  v1 & v2 & v3) %caso simbólico
     x0=d3; y0=d2; z0=d1; x0=vpa(x0); y0=vpa(y0); z0=vpa(z0);
  else %caso numérico
     x0=d3; y0=d2; z0=d1;
  end
end

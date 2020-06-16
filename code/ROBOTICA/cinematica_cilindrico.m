function [x0, y0,z0]=cinematica_cilindrico(beta1,l1,q1,d2,d3)
dato1=whos('beta1'); dato2=whos('l1'); dato3=whos('q1');
dato4=whos('d2'); dato5=whos('d3'); v1=strcmp(dato1.class, 'sym');
v2=strcmp(dato2.class, 'sym'); v3=strcmp(dato3.class, 'sym');
v4=strcmp(dato4.class, 'sym'); v5=strcmp(dato5.class, 'sym'); digits(3);

 if (  v1 & v2 & v3 & v4 & v5) % caso simbólico
     x0= -d3*sin(q1);
     y0= d3*cos(q1);
     z0=l1+beta1+d2;
     x0=vpa(x0); y0=vpa(y0); z0=vpa(z0);
 else %caso numérico
        x0= -d3.*sin(q1);
       y0= d3.*cos(q1);
     z0=l1+beta1+d2;
 end
end

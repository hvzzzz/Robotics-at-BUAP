function [x0, y0,z0]=cinematica_esferico(beta1,beta2,l1,q1,q2,d3)
dato1=whos('beta1'); dato2=whos('beta2'); dato3=whos('l1');
dato4=whos('q1'); dato5=whos('q2'); dato6=whos('d3'); 
v1=strcmp(dato1.class, 'sym'); v2=strcmp(dato2.class, 'sym'); 
v3=strcmp(dato3.class, 'sym'); v4=strcmp(dato4.class, 'sym'); 
v5=strcmp(dato5.class, 'sym'); v6=strcmp(dato6.class, 'sym'); 
digits(3);

if (  v1 & v2 & v3 & v4 & v5 & v6)% caso simbólico
    x0=simplify(vpa(-beta2*sin(q1)+d3*cos(q1)*sin(q2),3));
     y0=simplify(vpa(beta2*cos(q1) + d3*sin(q1)*sin(q2),3));
     z0=simplify(vpa(beta1 + l1 + d3.*cos(q2),3));
     x0=vpa(x0); y0=vpa(y0); z0=vpa(z0);
else %caso numérico
   x0=-beta2*sin(q1)+d3.*cos(q1).*sin(q2);
     y0= beta2*cos(q1) + d3.*sin(q1).*sin(q2);
     z0=beta1 + l1 + d3.*cos(q2);  
end
end

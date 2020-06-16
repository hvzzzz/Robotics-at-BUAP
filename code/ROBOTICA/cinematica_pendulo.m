function [x0, y0, z0]=cinematica_pendulo(beta1,l1,q1)
dato1=whos('beta1'); dato2=whos('l1'); dato3=whos('q1');
v1=strcmp(dato1.class, 'sym');  v2=strcmp(dato2.class, 'sym'); 
v3=strcmp(dato3.class, 'sym'); digits(3);

if (v1 & v2 & v3) %caso simbólico
        x0=l1*cos(q1);  
        y0=l1*sin(q1);  
        z0=beta1;
else %caso numérico 
 x0=double(simplify(vpa(l1*cos(q1),3))); 
y0= double(simplify(vpa(l1*sin(q1),3))); 
     z0=double(simplify(vpa(beta1,3)));
end
end

function [x0, y0, z0]=cinematica_r3gdl(beta1,l1,q1,beta2,l2,q2,beta3,l3,q3)
dato1=whos('beta1'); dato2=whos('l1'); dato3=whos('q1');
dato4=whos('beta2'); dato5=whos('l2'); dato6=whos('q2');
dato7=whos('beta3'); dato8=whos('l3'); dato9=whos('q3');

v1=strcmp(dato1.class, 'sym');v2=strcmp(dato2.class, 'sym');
v3=strcmp(dato3.class, 'sym');v4=strcmp(dato4.class, 'sym');
v5=strcmp(dato5.class, 'sym');v6=strcmp(dato6.class, 'sym');
v7=strcmp(dato7.class, 'sym');v8=strcmp(dato8.class, 'sym');
v9=strcmp(dato9.class, 'sym'); digits(3);


if (v1 & v2 & v3 & v4 & v5 & v6 & v7 & v8 & v9) %caso simbólico
     x0=simplify(vpa((beta2+beta3)*sin(q1)+cos(q1)*(l3*cos(q2 + q3) + l2*cos(q2)),3));
     y0=simplify(vpa(-(beta2+beta3)*cos(q1)+sin(q1)*(l3*cos(q2 + q3) + l2*cos(q2)),3));
     z0=simplify(vpa( l1 +beta1+ l3*sin(q2 + q3) + l2*sin(q2) ,3));
     x0=vpa(x0); y0=vpa(y0);
else %caso numérico
     x0=(beta2+beta3)*sin(q1)+cos(q1).*(l3*cos(q2 + q3) + l2*cos(q2));
     y0=-(beta2+beta3)*cos(q1)+sin(q1).*(l3*cos(q2 + q3) + l2*cos(q2));
     z0=l1 +beta1+ l3*sin(q2 + q3) + l2*sin(q2);
end
end

function [x0,y0,z0]=direct_robot(l1,l2,beta1,beta2,d3,q1,q2)
    dato1=whos('d3');dato2=whos('q1');dato3=whos('q2');
    dato4=whos('l1');dato5=whos('l2');dato6=whos('beta1');
    dato7=whos('beta1');dato8=whos('beta2');
    v1=strcmp(dato1.class,'sym');v2=strcmp(dato2.class,'sym');v3=strcmp(dato3.class,'sym');
    v4=strcmp(dato4.class,'sym');v5=strcmp(dato5.class,'sym');v6=strcmp(dato6.class,'sym');
    v7=strcmp(dato7.class,'sym');v8=strcmp(dato8.class,'sym')
    digits(3);
    if(v1&v2&v3&v4&v5&v6&v7&v8)
        x0=simplify(vpa(cos(q1)*cos(q2)*d3+sin(q1)*beta2));
        y0=simplify(vpa(sin(q1)*cos(q2)*d3-cos(q1)*beta2));
        z0=simplify(vpa(sin(q2)*d3+l1+l2+beta1));
    else
        x0=cos(q1).*cos(q2).*d3+sin(q1).*beta2;
        y0=sin(q1).*cos(q2).*d3-cos(q1).*beta2;
        z0=sin(q2).*d3+l1+l2+beta1;
    end
end
function  [q1, q2, q3]=cinv_r3gdl(beta2,beta3,l2,l3,x0,y0,z0)
v1=sqrt(x0.*x0+y0.*y0-(beta2+beta3)^2);
%articulación de la base q_1
 q1=atan(y0./x0)-atan((beta2+beta3)./v1);
 c3=(x0.*x0+y0.*y0+z0.*z0-l2^2-l3^2)./(2*l2*l3);
 s3=sqrt(1-c3.*c3);
%articulación del codo q_3
 q3=atan(s3./c3);
 s2=(z0.*(l2+l3.*c3)-l3*s3.*sqrt(x0.*x0+y0.*y0))./(x0.*x0+y0.*y0+z0.*z0);
 c2=((l2+l3.*c3).*sqrt(x0.*x0+y0.*y0)+l3*s3.*z0)./(x0.*x0+y0.*y0+z0.*z0);
q2=atan(s2./c2); %articulación del hombro
end



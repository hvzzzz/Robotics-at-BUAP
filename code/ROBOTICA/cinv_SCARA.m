function   [d3 q2 q1]=cinv_SCARA(beta1,beta2,l1,l2,l3,x0,y0,z0)
q2=acos((x0.*x0+y0.*y0-l2*l2-l3*l3)/(2*l2*l3));
 q1=atan(y0./x0)-atan((l3*sin(q2))./(l2+l3*cos(q2)));
 d3=l1+beta1+beta2-z0;
end



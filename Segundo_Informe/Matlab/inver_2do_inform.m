function[d3 q1 q2]=inver_2do_inform(x0,y0,l3,alpha)
d3=sqrt(x0.*x0+y0.*y0+alpha.^2)-l3;
q1=atan(y0./x0);
q2=0;
%q2=atan(alpha./sqrt(x0.^2+y0.^2));
end
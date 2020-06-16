function [x0, y0, z0]=cinematica_SCARA(beta1,beta2,l1,l2,l3,q1,q2,d3)
x0=l2*cos(q1)+l3*cos(q1+q2);
y0=l2*sin(q1)+l3*sin(q1+q2);
z0=l1+beta1+beta2-d3;
end


function   [q1, q2, d3]=cinv_esferico(beta1,beta2,l1,x0,y0,z0)
w1=y0.*sqrt(x0.*x0+y0.*y0-beta2*beta2)-x0*beta2;
w2=x0.* sqrt(x0.*x0+y0.*y0-beta2*beta2)+y0*beta2;
q1=atan(w1./w2);
w3=z0-(l1+beta1);
w4=sqrt(x0.*x0+y0.*y0-beta2*beta2);
q2=pi/2+atan(w3./w4);
d3=sqrt(x0.*x0+y0.*y0-beta2*beta2+(z0-(l1+beta1)).*(z0-(l1+beta1)));
end

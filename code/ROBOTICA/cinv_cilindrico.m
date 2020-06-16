function [q1, d2,d3]=cinv_cilindrico(beta1,l1,x0,y0,z0)
q1= -pi/2+atan(-x0./y0);
     d2=z0-(l1+beta1);
     d3= sqrt(x0.*x0+y0.*y0);
end

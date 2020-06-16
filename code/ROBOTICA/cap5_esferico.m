clc; 
clear all; 
close all;  
format short
syms  q1 q2 d3 beta1 beta2 l1  alpha1 alpha2 alpha3 real

H30=H_esferico();
disp('Transformación homogénea del robot esférico');
disp(H30);
[R30, cinemat_esferico,cero, c]=H_DH(H30);
disp('Matriz de rotación');
disp(R30);
disp('cinemática directa');
disp(cinemat_esferico);
[x0, y0,z0]=cinematica_esferico(beta1,beta2,l1,q1,q2,d3); 
disp([x0; y0;z0])
jac_esferico=jacobian([x0; y0;z0], [q1;q2;d3])
  det_esferico=simplify(vpa(det(jac_esferico),3))

%ejemplo numérico 
   l1=0.5; beta1=0.10; beta2=0.05;  
  t=0:0.001:100; [n m]=size(t);
%ecuación del círculo con centro en xc,yc y radio r
xc=0.3; yc=-0.3; r=0.25;
   q1=[]; q2=[]; d3=[]; k=1; 
      
   x=xc+r.*sin(t);
  y=yc+r.*cos(t);
   z=k*t;
[q1, q2, d3]=cinv_esferico(beta1,beta2,l1,x,y,z);
[x0, y0,z0]=cinematica_esferico(beta1,beta2,l1,q1,q2,d3);

subplot(2,2,1); plot3(x0,y0,z0)
subplot(2,2,2); plot(t,q1)
subplot(2,2,3); plot(t,q2)
subplot(2,2,4); plot(t,d3)


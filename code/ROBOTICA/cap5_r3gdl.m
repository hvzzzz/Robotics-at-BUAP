clc; 
clear all; 
close all;  
format short
syms  q1 q2 q3 beta1 beta2 beta3 l1 l2 l3 alpha1 alpha2 alpha3 real

H30=H_r3gdl();
disp('Tansformación homogénea del robot antropomórfico de 3 gdl');
disp(H30);
[R30, cinemat_r3gdl,cero, c]=H_DH(H30);
disp('Matriz de rotación');
disp(R30);
disp('cinemática directa');
disp(cinemat_r3gdl);
[x0, y0,z0]= cinematica_r3gdl(beta1,l1,q1,beta2,l2,q2,beta3,l3,q3); disp([x0; y0;z0])
jac_r3gdl=jacobian([x0; y0;z0], [q1;q2;q3])
det_r3gdl=simplify(vpa(det(jac_r3gdl),3))


%ejemplo numérico 
l1=0;  l2=0.45; l3=0.45;
t=0:0.001:100; 
 xc=0.3; yc=-0.3; r=0.20;
 beta1=0.12; beta2=0.01; beta3=0.01;
 q1=[]; q2=[]; q3=[]; 
x=xc+r*sin(t);
y=yc+r*cos(t);
z=1.0*t;
[q1, q2, q3]=cinv_r3gdl(beta2,beta3,l2,l3,x,y,z);
[x0, y0,z0]=cinematica_r3gdl(beta1,l1,q1,beta2,l2,q2,beta3,l3,q3);


subplot(2,2,1); plot3(x0,y0,z0)
subplot(2,2,2); plot(t,q1)
subplot(2,2,3); plot(t,q2)
subplot(2,2,4); plot(t,q3)


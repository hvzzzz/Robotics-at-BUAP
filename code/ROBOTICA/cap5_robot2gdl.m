clc; 
clear all; 
close all; 
format short
syms  q1 q2  beta1 beta2 l1 l2 alpha1 alpha2 real
H20=H_r2gdl()
disp('Transformación homogénea del robot 2 gdl');
disp(H20);
[R20, cinemat_r2gdl,cero, c]=H_DH(H20);
disp('Matriz de rotación'); disp(R20);
disp('cinemática directa');
disp(cinemat_r2gdl);
[x0, y0, z0]=cinematica_r2gdl(beta1,l1,q1,beta2,l2,q2)


jac_r2gdl=jacobian([x0; y0], [q1;q2])
 

det_r2gdl=simplify(det(jac_r2gdl)) % det[J]=l_1l_2 sin(q_2)


%ejemplo numérico
t=0:0.001:100;
%parámetros del  círculo: [x_c,y_c]'=[0.3,-0.3]' y radio r=0.2
xc=0.3; yc=-0.3; r=0.20;
l1=0.45; l2=0.45;
 beta1=0.1; beta2=0.1;
q1=[]; q2=[]; 

% ecuación del círculo
x=xc+r*sin(t); 
y=yc+r*cos(t);
% cinemática inversa
[q1,q2]=cinv_r2gdl(l1,l2,x,y);
%coordenas cartesianas del extremo final del robot de 2 gdl
[x0, y0, z0]=cinematica_r2gdl(beta1,l1,q1,beta2,l2,q2);

subplot(2,2,1); plot(x,y)%circulo
subplot(2,2,2); plot(t,q1,t,q2)%articulaciones
subplot(2,2,3); plot(x0,y0)%extremo final


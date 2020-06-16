clc; 
clear all; 
close all; 
format short
syms theta l   d alpha q real
syms  q1 q2 d3 beta1 beta2 l1 l2 l3  alpha1 alpha2 alpha3 real

H30=H_SCARA()
[R30, frq_scara, cero, c]=H_DH(H30);
 jac_scara=jacobian(frq_scara, [q1;q2;d3])
 det_scara=simplify(det(jac_scara))

%ejemplo numérico
%parámetros geométricos del robot SCARA
l1=0.45; l2=0.45; l3=0.45; beta1=0.1; beta2=0.1;
t=0:0.001:100;
%ecuación de la figura  centro en xc,yc y radio r
xc=0.3; yc=-0.3;

q1=[]; q2=[];z0=[]; d3=[];
[n m]=size(t); % dimensión del vector de tiempo 

for k=1:m %forma recursiva
%ecuación cartesiana de la figura rosa polar
r=0.1*sin(6*t(k)/7);  % radio de la figura
x=xc+r*(sin(t(k)))^3;
 y=yc+r*(cos(t(k)))^3;
 z=-0.5; % conversión de coordenadas cartesianas de la rosa polar 
%a coordenadas articulares del robot SCARA 
[d3(k), q2(k), q1(k)]=cinv_SCARA(beta1,beta2,l1,l2,l3,x,y,z);
end

%trayectoria del robot SCARA en el sistema sis{0}
[x0, y0, z0]=cinematica_SCARA(beta1,beta2,l1,l2,l3,q1,q2,d3);
plot3(x0,y0,z0)

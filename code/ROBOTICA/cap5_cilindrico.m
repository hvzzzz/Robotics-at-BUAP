clc; 
clear all; 
close all;  
format short
syms  q1 d2 d3  beta1 l1 alpha1 alpha2 alpha3 real

H30=H_cilindrico();
disp('Transformación homogénea del robot cilíndrico');
[R30, cinemat_cilindrico,cero, c]=H_DH(H30);
disp('Matriz de rotación'); 
disp(R30);
disp('cinemática directa'); disp(cinemat_cilindrico);
[x0, y0,z0]=cinematica_cilindrico(beta1,l1,q1,d2,d3);
disp([x0; y0;z0])
 jac_cilindrico=jacobian([x0;y0;z0], [q1;d2;d3])
det_cilindrico=simplify(vpa(det(jac_cilindrico),3))


%ejemplo numérico
t=0:0.001:100;
%ecuación de la rosa polar con centro en (xc,yc) y radio r\n
xc=0.3; yc=-0.3; beta1=0.05; l1=0.40;
   q1=[]; d2=[]; d3=[]; r=0.2; 
[n m]=size(t);
 r=0.05+0.1*sin(t);
 x=xc+r.*sin(t);
 y=yc+r.*cos(t);
 z(1:m)=l1+beta1+0.05;
%conversión de coordenadas cartesianas a coordenadas articulares del robot
[q1, d2, d3]=cinv_cilindrico(beta1,l1,x,y,z);
%coordenadas cartesianas del extremo final del robot
 [x0, y0,z0]=cinematica_cilindrico(beta1,l1,q1,d2,d3);
plot3(x0,y0,z0)%trayectoria trazada por el robot

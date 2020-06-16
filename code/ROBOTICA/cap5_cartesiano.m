clc; 
clear all; 
close all;  
format short
syms  d1 d2 d3 alpha1 alpha2 alpha3 real
H30=H_cartesiano();
disp('Transformación homogénea del robot cartesiano'); disp(H30);
[R30, cinemat_cartesiano,cero, c]=H_DH(H30);
disp('Matriz de rotación'); disp(R30);
disp('cinemática directa');
disp(cinemat_cartesiano);
[x0, y0,z0]=cinematica_cartesiano(d3,d2,d1);
disp([x0; y0;z0])

 jac_cartesiano=jacobian([x0;y0;z0], [d3;d2;d1])
det_cartesiano=simplify(vpa(det(jac_cartesiano),3))

%ejemplo numérico 
t=0:0.001:100; 
%ecuación de la flor con 8 pétalos centro en xc,yc y radio r
xc=0.3; yc=-0.3;
   d1=[]; d2=[]; d3=[];  
[n m]=size(t);
   
%cordenadas de la figura
   r=0.1*cos(pi*t);
   x=xc+r.*sin(t);
   y=yc+r.*cos(t);
   z(1:m)=0.5;
   
%las coordenadas de la figura se convierte a coordenadas de los servos del robot   
[d3, d2, d1]=cinv_cartesiano(x,y,z);

%coordenadas del extremo final o herramienta del robot
[x0, y0,z0]=cinematica_cartesiano(d3,d2,d1);

subplot(2,2,1); plot3(x0,y0,z0)% extremo final
subplot(2,2,2); plot(t,d1)
subplot(2,2,3); plot(t,d2)
subplot(2,2,4); plot(t,d3)

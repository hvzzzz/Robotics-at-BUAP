clc; 
clear all; 
close all;  
format short
syms  d1 d2 d3 alpha1 alpha2 alpha3 real
H30=H_cartesiano();
disp('Transformaci�n homog�nea del robot cartesiano'); disp(H30);
[R30, cinemat_cartesiano,cero, c]=H_DH(H30);
disp('Matriz de rotaci�n'); disp(R30);
disp('cinem�tica directa');
disp(cinemat_cartesiano);
[x0, y0,z0]=cinematica_cartesiano(d3,d2,d1);
disp([x0; y0;z0])

 jac_cartesiano=jacobian([x0;y0;z0], [d3;d2;d1])
det_cartesiano=simplify(vpa(det(jac_cartesiano),3))

%ejemplo num�rico 
t=0:1:21; 
%ecuaci�n de la flor con 8 p�talos centro en xc,yc y radio r
xc=0.0; yc=-0.0;
   d1=[]; d2=[]; d3=[];  
[n m]=size(t);
   
%cordenadas de la figura
   r=0.1;
   %i=0:0.1:5;
   %x=0.*i;
   %y=(5+x);
   %x=0.*(t);
   %y=r.*(t);
   z(1:m)=0.0;
   i=[0,1,2,3,4,5,6,7,8,9,10,7.2727,6.8333,6.4615,6.1429,5.8667,5.6250,5.1765,4.7778,4.4211,4.1000,3.8095];
   s=[0,0,0,0,0,0,0,0,0,0,0,0,0.3333,0.6154,0.8571,1.0667,1.2500,1.4118,1.5556,1.6842,1.8000,1.9048];
   y=(1*i).*((t)*r);
   x=(1*s).*((t)*r);
%las coordenadas de la figura se convierte a coordenadas de los servos del robot   
[d3, d2, d1]=cinv_cartesiano(x,y,z);

%coordenadas del extremo final o herramienta del robot
[x0, y0,z0]=cinematica_cartesiano(d3,d2,d1);

subplot(2,2,1); plot3(x0,y0,z0)% extremo final
subplot(2,2,2); plot(t,d1)
subplot(2,2,3); plot(t,d2)
subplot(2,2,4); plot(t,d3)
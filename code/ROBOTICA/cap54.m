clc; 
clear all; 
close all;  
format short

coordenadas=load('datos.dat');
x=coordenadas(:,1);
y=coordenadas(:,2);

l1=0;  l2=0.45; l3=0.45;

 xc=0.3; yc=-0.3; r=0.10;
 beta1=0.012; beta2=0.012; beta3=0.01;
 q1=[]; q2=[]; q3=[];
 
[ren col]=size(x);
z=0.5*ones(ren,col);

[q1, q2, q3]=cinv_r3gdl(beta2,beta3,l2,l3,x,y,z);
[x0, y0,z0]=cinematica_r3gdl(beta1,l1,q1,beta2,l2,q2,beta3,l3,q3);
%plot3(x0,y0,z0)

plot(x0,y0,'.')

clc; clear all; close all;
format short;
syms q1 q2 d3 l1 l2 l3 beta1 beta2
%direct
x0=[];y0=[];z0=[];
[x0,y0,z0]=direct_robot(l1,l2,beta1,beta2,d3,q1,q2);
disp([x0;y0;z0]);
%inverse
t=0:0.001:100;
a=1.5;c=1.5;b=0.1;d=0.25;
l1=1.40;l2=1.4;l3=1.4;beta1=0.1;beta2=0.1;zc=5;
q1=[];q6=[];d3=[];
[n m]=size(t);
x=a+b.*cos(t);
y=c+d.*sin(t);
z=zc
alpha=z-(l1+l2+beta1)
[d3 q1 q2]=inver_2do_inform(x,y,l3,alpha);
[x0,y0,z0]=direct_robot(l1,l2,beta1,beta2,d3,q1,q2);
plot3(x0,y0,z0);


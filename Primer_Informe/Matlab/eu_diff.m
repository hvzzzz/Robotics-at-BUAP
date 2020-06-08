clc;clear all;close all;
t=0:0.001:10;
f=sin(t);
%f1=diff(t.^2)./diff(t);
dfdt=diff(f)./diff(t);
t1=0:0.001:9.999;
%plot(t1,f1);
plot(t1,dfdt,t1,cos(t1));
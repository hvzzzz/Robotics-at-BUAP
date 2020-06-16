clc; 
clear all; 
close all; 
format short
 xc1=3;
 yc1=.5;   
 t=1.5:0.001:6.3;
 r=.5;
 x1=xc1+r.*sin(t);
 y1=yc1+r.*cos(t); 
 
 t=1.6:0.001:3.15;
 xc1=2.5; yc1=1;   
 x2=xc1+r.*sin(t);
 y2=yc1+r.*cos(t); 
 
plot(x1,y1,x2,y2)

hold on

xc1=4; yc1=.5;   
 t=.7:0.001:5.5;
 x=xc1+r.*cos(t);
 y=yc1+r.*sin(t);
 plot(x,y) 

 xc=6; yc=.5;  
 t=0:0.001:7;
 x1=xc+r.*cos(t);
 y1=yc+r.*sin(t);

 xc=7; yc=1; 
 t=3.15:0.001:6.2;
 x2=xc+r.*2.*cos(t);
 y2=yc+r.*sin(t);
plot(x1,y1,x2,y2) 

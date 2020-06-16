clc; 
clear all; close all;
pzo=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
pyo=[0,0,0,0,0,9,9,10,9, 11, 9,12,  1, 2,  3,  4,  5,  6,7,  8,  9, 12, 12, 12, 12,1,  2,  3,  4,   5,  6,  7, 8,  9,  12,  9,  12, 9, 11, 9, 10, 9,0,0,0 ];
pxo=[0,0,0,0,0,6,7,7, 8,  8, 9,9, 10,10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 12, 13, 14,14, 14, 14,  14, 14, 14, 14,14,  14,  15, 15, 16,16, 17,17,18,19,20,21];

theta=90*3.1416/180.0;
R_ztheta=[ cos(theta), -sin(theta), 0;  sin(theta), cos(theta), 0; 0, 0,1];       
R_xtheta=[ 1, 0, 0; 0, cos(theta), -sin(theta); 0, sin(theta), cos(theta)];
R_ytheta=[ cos(theta), 0, sin(theta);  0, 1, 0;  -sin(theta), 0, cos(theta)];
       
%[x_1; y_1; z_1]=R{z}(theta)[x_0; y_0; z_0]' 
Sigma1=R_ztheta*[pxo; pyo; pzo];
px1=Sigma1(1,:);py1=Sigma1(2,:); pz1=Sigma1(3,:);

%[x_2; y_2; z_2]=R{x}(theta)[x_1; y_1; z_1]
Sigma2=R_xtheta*[px1; py1; pz1]; 
px2=Sigma2(1,:); py2=Sigma2(2,:); pz2=Sigma2(3,:);

%[x_3; y_3; z_3]=R{y}(theta)[x_2;  y_2; z_2]
Sigma3=R_ytheta*[px2; py2; pz2];
px3=Sigma3(1,:); py3=Sigma3(2,:); pz3=Sigma3(3,:);
plot3(pxo,pyo,pzo,'.',px1,py1,pz1,'x',px2,py2,pz2,'o',px3,py3,pz3,'o')

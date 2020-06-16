clc; 
clear all; 
close all;
%coordenadas del vector p_0=[px0; py0; pz0]
pxo=[0,0,0,0,0,6,7,7, 8,  8, 9,9, 10,10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 12, 13, 14,14, 14, 14,  14, 14, 14, 14,14,  14,  15, 15, 16,16, 17,17,18,19,20,21];
pyo=[0,0,0,0,0,9,9,10,9, 11, 9,12,  1, 2,  3,  4,  5,  6,7,  8,  9, 12, 12, 12, 12,1,  2,  3,  4,   5,  6,  7, 8,  9,  12,  9,  12, 9, 11, 9, 10, 9,0,0,0 ];
pzo=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];


theta=90*3.1416/180.0;
%matriz de rotación Rot{z}{theta}
R_ztheta=[ cos(theta), -sin(theta), 0;  
            sin(theta), cos(theta), 0; 
                   0, 0,1];

%conversión de coordenadas del sistema sis{0} al sistema sis{1}    
% p_1=Rot{z}{theta}p_0
Sigma1=R_ztheta*[pxo; pyo; pzo];

%p_1=[px1;  py1;  pz1]
px1=Sigma1(1,:);
py1=Sigma1(2,:);
pz1=Sigma1(3,:);
%puntos graficados en los sistemas p_0  in sis{0} y p_1 in sis{1}
plot3(pxo,pyo,pzo,'.',px1,py1,pz1,'x')

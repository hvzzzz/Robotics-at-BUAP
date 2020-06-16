
clc; 
clear all; 
close all;

disp('Producto interno o escalar de vectores')

x = [2; 4 ]; %vector columna de dos renglones  x\in R^2
y = [8; -3];%vector columna de dos renglones y\in \R^2

xdoty=dot(x,y)  %producto interno  x . y usando la funci�n dot
xdoty_m=x'*y %forma matem�tica del producto interno x dot y
ydotx_m=y'*x %forma matem�tica del producto interno x dot y



theta=acos(x'*y/(norm(x,2)*norm(y,2))) %�ngulo que forman los vectores x,y \in \R^2
%forma geom�trica del producto interno: x dot y=|x||y|cos(theta)
xdoty_geometrica=norm(x,2)*norm(y,2)*cos(theta)
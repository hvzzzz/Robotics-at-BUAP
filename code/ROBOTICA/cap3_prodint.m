
clc; 
clear all; 
close all;

disp('Producto interno o escalar de vectores')

x = [2; 4 ]; %vector columna de dos renglones  x\in R^2
y = [8; -3];%vector columna de dos renglones y\in \R^2

xdoty=dot(x,y)  %producto interno  x . y usando la función dot
xdoty_m=x'*y %forma matemática del producto interno x dot y
ydotx_m=y'*x %forma matemática del producto interno x dot y



theta=acos(x'*y/(norm(x,2)*norm(y,2))) %ángulo que forman los vectores x,y \in \R^2
%forma geométrica del producto interno: x dot y=|x||y|cos(theta)
xdoty_geometrica=norm(x,2)*norm(y,2)*cos(theta)
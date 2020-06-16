clc; 
clear all; 
close all;
format short
syms beta1 l1  q1 real
%H^1_0=HDH{0}{q_1}{beta_1}{l_1}{0}
H10=H_pendulo()
%obtiene la matriz de rotación R^1_0 y cinemática directa $f_r(q)
[R10, frq_pendulo, cero, c]=H_DH(H10) %R^1_0, f_R(beta_1,l_1,q_1)
jac_pendulo=jacobian(frq_pendulo, q1)
H10a=HRz(-pi/2)*H10 %{H10}_{a}=HR{z_0}{-pi/2}H10
%ejemplo numérico
q1=55*pi/180;%posición angular del péndulo 
l1=0.45; beta1=0.1; %longitud del péndulo y espesor del servomotor
%cinemática cartesiana cuadrante I: f_{R_{I}}(beta_1,l_1,q_1)
[x0,y0,z0]=cinematica_pendulo(beta1,l1,q1)
%cinemática directa en el cuadrante IV
Rz(-pi/2)*cinematica_pendulo(beta1,l1,q1)



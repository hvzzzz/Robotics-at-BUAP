
clc
clear all
close all

syms  q1 q2 q3 beta1 beta2 beta3 l1 l2 l3  alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot planar vertical de 3 gdl')
disp('[ l  alpha d   q]')
dh=[l1, pi/2, l1+beta1, q1; l2, 0, beta2, q2; l3, 0, beta3, q3]; 
disp(dh)

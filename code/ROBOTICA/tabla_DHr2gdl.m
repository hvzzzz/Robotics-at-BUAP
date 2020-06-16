clc
clear all
close all

syms  q1 q2 beta1 beta2 l1 l2  alpha1 alpha2 real
disp('Parámetros Denavit-Hartenberg del robot planar vertical de 2 gdl')
disp('[ l  alpha d   q]')
dh=[l1, 0, beta1, q1; l2, 0, beta2, q2]; 
disp(dh)

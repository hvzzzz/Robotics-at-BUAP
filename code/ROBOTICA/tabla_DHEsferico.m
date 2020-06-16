
clc
clear all
close all

syms  q1 q2 q3 beta1 beta2 l1 l2 l3  d1 d2 d3 alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot Esférico'); 
disp('[ l  alpha d   q]')
dh=[0, -pi/2, l1+beta1, q1; 0, pi/2, beta2, q2; 0, 0, d3, 0]; 
disp(dh)

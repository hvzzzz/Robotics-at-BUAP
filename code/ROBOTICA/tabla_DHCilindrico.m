clc
clear all
close all

syms  q1 d2 d3 beta1 l1 alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot cilíndrico'); 
disp('[ l  alpha d   q]'); 
dh=[0, 0, l1+beta1, q1; 0, -pi/2, d2, 0; 0, 0, d3, 0]; 
disp(dh)



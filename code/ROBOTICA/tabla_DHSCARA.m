
clc
clear all
close all

syms  q1 q2 q3 beta1 beta2 l1 l2 l3  d1 d2 d3 alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot SCARA')
disp('[l  alpha d   q]')
%tabla de parámetros DH del robot SCARA
dh=[0, 0,l1+beta1, q1; l2, pi, beta2, q2; l3, 0, d3, 0];
%despliega parámetros DH del robot SCARA
disp(dh)


clc
clear all
close all

syms  l1 l2 l3  d1 d2 d3 alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot cartesiano')
disp('[ l  alpha   d   q]')
dh=[0, -pi/2, d1, 0; 0, -pi/2, d2, 0; 0, 0, d3, 0];
%despliega tabla de parámetros DH
disp(dh)

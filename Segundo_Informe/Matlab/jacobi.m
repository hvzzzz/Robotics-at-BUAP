clc;clear all;close all;
syms q1 q2 l1 l2 l3 d3 b1 b2
J=[-sin(q1)*cos(q2)*(d3+l3)+cos(q1)*b2 -cos(q1)*sin(q2)*(d3+l3) cos(q1)*cos(q2);cos(q1)*cos(q2)*(d3+l3)+sin(q1)*b2 -sin(q1)*sin(q2)*(d3+l3) sin(q1)*cos(q2);0 cos(q2)*(l3+d3) sin(q2)]
pretty(det(J))
pretty(simplify(det(J)))

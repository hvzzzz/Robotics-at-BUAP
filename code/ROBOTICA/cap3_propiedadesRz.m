clc;
clear all;
close all;
syms  a b real
%resultados simbólicos
simplify(Rz(a)*Rz(b)) %Rot{z}{a} Rot{z}{b}
simplify(Rz(b)*Rz(a)) %Rot{z}{b} Rot{z}{a}
simplify(inv(Rz(a))) %{Rot{z}{a}}^(-1)
simplify(Rz(-a))  %Rot{z}{a}^{-1}=Rot{z}{-a} 
simplify(Rz(a)')  %{Rot{z}{a}}^T={Rot{z}{a}}^{-1}
simplify(Rz(a)'*Rz(a)) %{Rot{z}{a}}^T Rot{z}{a}=I
simplify(Rz(a)*Rz(a)') %Rot{z}{a}{Rot{z}{a}}^T=I
simplify(det(Rz(a))) %det[Rot{z}{a}]=1
%cálculo numérico
theta=90*pi/180; %theta=pi/2
Rz(theta)  %Rot{z}{theta}


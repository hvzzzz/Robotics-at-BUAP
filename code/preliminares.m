w=[1;4;6]
[n m]=size(w);
w'
normaw=sqrt(w'*w);
syms a11 a12 a21 a22
A=[1 2;3 4];
A1=[a11 a22;a12 a22];
x=[1;2]
y=[3;4]
%1 norma euclideana
x1=sqrt(x'*x)
y1=sqrt(y'*y)
%2 desarrollar
%a
x'*x
%b
x*x'
%c
x'*y
%d
y*x'
%e
y'*x
%f
y'*x
%3 norma espectral
vp=sqrt(eig(A'*A));
vpmax=max(vp);
disp('norma espectral de la matriz A')
[norm(A) vpmax]

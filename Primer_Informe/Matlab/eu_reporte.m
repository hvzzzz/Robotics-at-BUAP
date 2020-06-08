clc;clear all; close all;
ti=0;tf=10;h=0.001;
ts=ti:h:tf;
cond_iniciales=[0,0,0];
opciones=odeset('RelTol',1e-06,'AbsTol',1e-06,'InitialStep',h,'Maxstep',h);
[t,x]=ode45('sso',ts,cond_iniciales,opciones);
[n,m]=size(x(:,1));
y=zeros(n,m);u=ones(n,m);
a0=pi;a1=0.23;a2=8;a3=9;
for k=4:n
    y(k)=(1/(a3/h^3+a2/h^2+a1/h+a0))*(3*u(k)+(3*a3/h^3+2*a2/h^2+a1/h)*y(k-1)-(3*a3/h^3+a2/h^2)*y(k-2)+a3/h^3*y(k-3));
end
figure
plot(t,y);
xlabel('[Segundos]')
ylabel('y(t)')


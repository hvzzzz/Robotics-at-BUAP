clc;clear all; close all;format short;
ti=0;tf=10;h=0.001;
ts=ti:h:tf;
cond_iniciales=[0,0,0];;
opciones=odeset('RelTol',1e-06,'AbsTol',1e-06,'InitialStep',h,'Maxstep',h);
[t,x]=ode45('sso',ts,cond_iniciales,opciones);
[m,n]=size(x(:,1));
fy=zeros(n,m);fyp=zeros(n,m);fypp=zeros(n,m);
fu=ones(n,m);y=zeros(n,m);
lamb=35;
a0=pi;a1=0.23;a2=8;a3=9;
for k=2:m
    fy(k)=exp(-lamb*h)*fy(k-1)+(1-exp(-lamb*h))*x(k-1,1);
    fyp(k)=exp(-lamb*h)*fyp(k-1)+(1-exp(-lamb*h))*x(k-1,2);
    fypp(k)=exp(-lamb*h)*fypp(k-1)+(1-exp(-lamb*h))*x(k-1,3);
    fu(k)=exp(-lamb*h)*fu(k-1)+(1-exp(-lamb*h))*fu(k-1);
    y(k)=(1/(9*lamb^3+8*lamb^2+0.23*lamb))*(9*lamb*fypp(k)+(9*lamb^2+8*lamb)*fyp(k)+(9*lamb^3+8*lamb^2+0.23*lamb-pi)*fy(k)+3*fu(k));
end
y1=zeros(n,m);u1=ones(n,m);
a0=pi;a1=0.23;a2=8;a3=9;
for k=4:m
    y1(k)=(1/(a3/h^3+a2/h^2+a1/h+a0))*(3*u1(k)+(3*a3/h^3+2*a2/h^2+a1/h)*y1(k-1)-(3*a3/h^3+a2/h^2)*y1(k-2)+a3/h^3*y1(k-3));
end
figure;plot(t,x(:,1),t,y1,t,y);legend('ODE45','Euler','Filtrado');xlabel('[Segundos]');ylabel('y(t)');
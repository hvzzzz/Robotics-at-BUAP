clc;clear all;close all;
h=0.001;
t=0:h:10;
%f=sin(t);
%f=8*(1+0.*t);
f=cos(t);
I_e=0;
I_trap=trapz(t,f);
%I_simp=quad('t.^2',0,10);
%I_simp=quad('8*(1+0.*t)',0,10);
I_simp=quad('cos(t)',0,10);
[m,n]=size(t);
for k=1:n
    I_e=I_e+h*f(k);
end
fprintf('euler=%f\ntrapezoidal=%f\nsimpson=%f',I_e,I_trap,I_simp);
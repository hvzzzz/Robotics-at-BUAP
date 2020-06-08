ti=0;tf=10;h=0.001;
ts=ti:h:tf;
cond_iniciales=[0,0,0];
opciones=odeset('RelTol',1e-06,'AbsTol',1e-06,'InitialStep',h,'Maxstep',h);
disp('Simulacion sistema lineal de segundo orden');
[t,x]=ode45('sso',ts,cond_iniciales,opciones);
figure
subplot(2,1,1);plot(t,x(:,1))
xlabel('[Segundos]')
ylabel('y(t)')
subplot(2,1,2);plot(t,x(:,2))
xlabel('[Segundos]')
ylabel('y(t)')
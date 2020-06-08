clc;clear all;close all;
format short
global n h tau1 tau2% Variables globales para graficar los pares aplicados
n=1;
tau1=0;
tau2=0;
ti=0;
h=0.0025; %Periodo de muestreo
tf = 10; % Tiempo de simulacion
ts=ti:h:tf;  %Tiempo de simulacion
opciones=odeset('RelTol' ,1e-06, 'AbsTol',1e-06,'InitialStep' ,h,'MaxStep',h);
condiciones_iniciales=[0; 0; 0; 0];%[q1,q2;qp1;qp2]
% Solucion del sistema:
[t,x]=ode45('robot2gdl',ts,condiciones_iniciales,opciones);
plot(t,(180/pi)*x(:,1),t,(180/pi)*x(:,2));%Grafica de posicion en el tiempo
ylabel("Posicion[grados]")
xlabel("Tiempo[seg]")
figure(2)
plot(t,90-(180/pi)*x(:,1),t,90-(180/pi)*x(:,2))%Grafica de error en el tiempo
ylabel("Error[grados]")
xlabel("Tiempo[seg]")
figure(3)
plot(linspace(0,10,length(tau1)),tau1,linspace(0,10,length(tau2)),tau2)%Grafica de pares aplicados en el tiempo
ylabel("Par Aplicado[Nm]")
xlabel("Tiempo[seg]")
legend({"Par Aplicado a la Articulacion del Hombro","Par Aplicado a la Articulacion del Codo"},'Location','east');
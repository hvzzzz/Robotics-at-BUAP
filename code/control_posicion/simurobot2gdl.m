clc;
clear all;
close all;
format short

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Par�metros de simulaci�n: 
    ti=0;
    h=0.0025; %Periodo de muestreo
    tf = 10; % Tiempo de simulaci�n (segundos)
    ts=ti:h:tf;  %Tiempo de simulaci�n
    opciones=odeset('RelTol' ,1e-06, 'AbsTol',1e-06,'InitialStep' ,h,'MaxStep',h);
    condiciones_iniciales=[0;  %q1
                                          0; %q2
                                          0; %qp1
                                          0]; %qp2
%-------------------------------------------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Soluci�n del sistema:
[t,x]=ode45('robot2gdl',ts,condiciones_iniciales,opciones);

plot(t,45-(180/pi)*x(:,1),t,90-(180/pi)*x(:,2))
%-------------------------------------------------------------------------%



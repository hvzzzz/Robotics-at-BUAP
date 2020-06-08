clc;clear all;close all;
format short 
%animacion=1; % 0:Deshabilita 1:Habilita animación
 
%Parámetros de simulación ------------------------------------------------%
    ti=0; %tiempo inicial (segundos)   
    tfinal=10; %tiempo de final (segundos)
    h=0.0025; %periodo de muestreo (segundos)
    ts=ti:h:tfinal; %vector de tiempo
    opciones=odeset('RelTol' ,1e-06, 'AbsTol',1e-06,'InitialStep' ,h,'MaxStep',h);
%-------------------------------------------------------------------------%

ci=[0; 0];
%Solución numérica del sistema -------------------------------------------%
 %   [t,x]=ode45('pendulo',[ti; tfinal],[89.999*pi/180; 0],opciones);
    [t,x]=ode45('pendulo',ts, ci,opciones); % ts es igual a t, es el tiempo real detnro de la funcion, x es la solucion

   % subplot(2,2,1);    plot(t,180*x(:,1)/pi,t,90-180*x(:,1)/pi)
   %  subplot(2,2,2);    plot(t,x(:,2))
    % subplot(2,2,3);    plot(x(:,2),90-180*x(:,1)/pi)
     
     subplot(2,1,1);    plot(t,180*x(:,1)/pi)
     subplot(2,1,2);    plot(t,180*x(:,2)/pi)
   
   qt=-10:0.001:10;
     
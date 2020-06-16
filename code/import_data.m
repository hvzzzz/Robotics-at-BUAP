clc;clear all;close all;
filename='robotGrupoD.dat';
delimiter=' ';
A=importdata(filename,delimiter,1);
time=A.data(:,1);
angle=A.data(:,2);
speed=A.data(:,3);
error=90-angle;
par_aplicado=A.data(:,4);
%plot(time,par_aplicado);
%title('Par Aplicado al Motor')
%xlabel('Segundos')
%ylabel('Nm')
plot(error,speed);
title('Error vs Velocidad');
xlabel('[Grados]')
ylabel('[Grados/seg]')
%plot3(error, speed, time,'o');
%title('Diagrama Fase(Error, Velocidad,Tiempo)');
%xlabel('[Grados]')
%ylabel('[Grados/seg]')
%zlabel('[Segundos]')
%figure
%subplot(3,1,1);plot(time,angle);
%subplot(3,1,2);plot(time,speed);
%subplot(3,1,3);plot(time,par_aplicado);
%subplot(2,1,1);plot(angle,speed);
%xlabel('[Grados]')
%ylabel('[Grados/seg]')
%subplot(2,1,2);plot(time,speed,time,par_aplicado);
%xlabel('[Segundos]')
%legend('Velocidad[grados/seg]','Par Aplicado[Nm]')


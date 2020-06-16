
function [qt, tau] = alg_control(t,x,xp)
q = [x(1); x(2)];   % Posiciones
qp = [xp(1); xp(2)]; %Velocidades


%referencias
qd1=45; % cinem�tica inversa
qd2=90;
qd=[qd1; qd2];  %Vector de referencias

if (qd  ~=0) kp1=0.8*150/qd1;
else kp1=1;
end
if (qd2  ~=0) kp2=0.8*15/qd1;
else kp1=1;
end

kp1=40; %% menor que tau_max=150  (hombro)
kp2=10; %%% menor que tau_max=15 (codo)
Kp=[kp1, 0; 0, kp2];  % Ganancia proporcional

 m=299; %sin m la cota m�xima de m=299

kv1=kp1;
kv2=kp2;
Kv=[kv1,  0; 0, kv2]; %Ganancia derivativa

 % Vector de pares de gravitacionales
    par_grav = [38.46*sin(q(1))+1.82*sin(q(1)+q(2));
               1.82*sin(q(1)+q(2))       ];

 qt=[pi*qd(1)/180-q(1); pi*qd(2)/180-q(2)];
 %Error de posici�n en grados
  qtgrados=(180/pi)*[qt(1) ;qt(2)]; 
  %velocidad en grados/segundo.
  
 
  qpgrados=180*qp/pi;
  
 
  
   control_p=[sinh(qt(1,1))*cosh(qt(1,1))^(m-1)/(1+cosh(qt(1,1))^(m));
                      sinh(qt(2,1))*cosh(qt(2,1))^(m-1)/(1+cosh(qt(2,1))^(m))];

  accion_d=[sinh(qp(1,1))*cosh(qp(1,1))^(m-1)/(1+cosh(qp(1,1))^(m));
                    sinh(qp(2,1))*cosh(qp(2,1))^(m-1)/(1+cosh(qp(2,1))^(m))];
   
  tau=Kp*control_p-Kv*accion_d+par_grav;
%tau=Kp*qt-Kv*qp+par_grav;
 % tau=Kp*tanh(qt)-Kv*tanh(qp)+par_grav;
  %tau=Kp*atan(qt)-Kv*atan(qp)+par_grav;
end






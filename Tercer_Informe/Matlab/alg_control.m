function [qt, tau] = alg_control(t,x,xp)
  q = [x(1); x(2)];   % Posiciones
  qp = [xp(1); xp(2)]; %Velocidades
  global n h tau1 tau2 % Variables globales para graficar los pares aplicados
  h=0.0025;
  %referencias
  qd1=90; % cinematica inversa
  qd2=90;
  qd=[qd1; qd2];  %Vector de referencias

  tau_max_h=150;
  tau_max_c=15;
  fqd1=((1+tanh(qd1)*tanh(qd1)))/tanh(qd1);
  fqd2=((1+tanh(qd2)*tanh(qd2)))/tanh(qd2);
  
  kp1=tau_max_h*fqd1;
  kp2=tau_max_c*fqd2;
  Kp=[kp1, 0; 0, kp2];  % Ganancia proporcional

  kv1=0.5*kp1;
  kv2=0.5*kp2;
  Kv=[kv1,  0; 0, kv2]; %Ganancia derivativa

  % Vector de pares de gravitacionales
  par_grav = [38.46*sin(q(1))+1.82*sin(q(1)+q(2));1.82*sin(q(1)+q(2))];
  qt=[pi*qd(1)/180-q(1); pi*qd(2)/180-q(2)];

  %Error de posicion en grados
  qtgrados=(180/pi)*[qt(1) ;qt(2)];

  %velocidad en grados/segundo.
  qpgrados=180*qp/pi;

  %Algoritmo de control
  hyper_p=[1/(cosh(qt(1,1))*cosh(qt(1,1)))*(tanh(qt(1,1)))/(1+tanh(qt(1,1))*tanh(qt(1,1)));1/(cosh(qt(2,1))*cosh(qt(2,1)))*(tanh(qt(2,1)))/(1+tanh(qt(2,1))*tanh(qt(2,1)))];
  hyper_d=[atan(qp(1,1));atan(qp(2,1))];
  tau=Kp*hyper_p-Kv*hyper_d+par_grav;

  %Adquisicion de pares aplicados
  if(round(t/h)==(n))
      tau1(n)=tau(1);
      tau2(n)=tau(2);
      n=n+1;
  end
end






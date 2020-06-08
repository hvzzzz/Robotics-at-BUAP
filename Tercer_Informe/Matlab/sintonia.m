tau_max_h=150;%Torque maximo del hombro=150Nm
tau_max_c=15;%Torque maximo del codo=150Nm
kp1=tau_max_h*fqd1*((1+tanh(qd1)*tanh(qd1)))/tanh(qd1);
kp2=tau_max_c*fqd2*((1+tanh(qd2)*tanh(qd2)))/tanh(qd2);
Kp=[kp1, 0; 0, kp2];  % Ganancia proporcional
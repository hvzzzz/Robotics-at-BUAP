%posiciones deseadas
qd1=90; 
qd2=90;
qd=[qd1; qd2];
%algoritmo de control
hyper_p=[1/(cosh(qt(1,1))*cosh(qt(1,1)))*(tanh(qt(1,1)))/(1+tanh(qt(1,1))*tanh(qt(1,1)));1/(cosh(qt(2,1))*cosh(qt(2,1)))*(tanh(qt(2,1)))/(1+tanh(qt(2,1))*tanh(qt(2,1)))];
hyper_d=[atan(qp(1,1));atan(qp(2,1))];
tau=Kp*hyper_p-Kv*hyper_d+par_grav;
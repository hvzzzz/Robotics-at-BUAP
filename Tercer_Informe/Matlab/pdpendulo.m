%aqui esta el algoritmo de control
function tau = pdpendulo(x,xp)

%Vector de estados (entradas) --------------------------------------------%
    q=x;  %posici�n articular
    qp=xp; %velocidad articular
%-------------------------------------------------------------------------%
m=5;      %masa
    lc=0.01;  %centro de gravedad
    g=9.81;   %constante de aceleraci�n gravitacional
    tau_max=15; 
    qd=pi*90/180; %referencia (posici�n deseada), 
    %esto esta en radianes, el angulo deseado es 90
    
    
%Par�metros del controlador ----------------------------------------------%
    kp= 0.8*tau_max/qd; %ganancia proporcional
    kv=0.005*kp; %ganancia derivativa
    %kp=0.8*tau_max*(1+qd*qd)/qd %regulador acotado
    %kp10;% kp debe ser menor que tau_max<15N
    %kp(q,qp)=(1-exp(-qt*qt))
%-------------------------------------------------------------------------%

%Vector de pares de gravitacionales --------------------------------------%
    par_grav = m*g*lc*sin(q);
%-------------------------------------------------------------------------%               

%Controlador tanh() ------------------------------------------------------%
    qt=qd-q; %error de posici�n
    tau=kp*180*qt/pi-kv*180*qp/pi+par_grav;%el 180/pi es para convertir a grados
    %esto por que esta en radianes
    %M�s esquemas de control......
    %tau=kp*sin(pi*tanh(qt)/2)-kv*sin(pi*tanh(qp)/2)+par_grav;
   % tau=kp*qt/(1+qt*qt)-kv*qp/(1+qp*qp)+par_grav;
    %tau=5*sign(180*qt/pi)-1*sign(180*qp/pi)+par_grav;
    %tau=kp*tanh(qt)-kv*tanh(qp)+par_grav;
     %tau=5*atan(180*qt/pi)-5*atan(180*qp/pi)+par_grav;
     %tau=0.0001*sinh(180*qt/pi)-0.0001*sinh(180*qp/pi)+par_grav;
%-------------------------------------------------------------------------%    
end

%aqui esta el modelo dinamico
function  xp=pendulo(t,x)

%Vector de estados (entradas) --------------------------------------------%
    q=x(1);  %posición articular
    qp=x(2); %velocidad articular
%-------------------------------------------------------------------------%    

%Parámetros del péndulo --------------------------------------------------%
    m=5;      %masa
    lc=0.01;  %centro de gravedad
    g=9.81;   %constante de aceleración gravitacional
    b=0.17;   %coeficiente de fricción viscosa
    fc=0.45;  %coeficiente de fricción de Coulomb
    Ir=0.16;  %momento de inercia del rotor
    Ip=m*lc^2+Ir;
%-------------------------------------------------------------------------%

%Par aplicado (controlador) ----------------------------------------------%
    tau = pdpendulo(q,qp);
    %[~, tau]=control_pendulo_sinhcosh_m(t,q,qp);
%-------------------------------------------------------------------------%    
  
%Modelo dinámico del péndulo ---------------------------------------------%
    %qpp=(tau-b*qp-m*g*lc*sin(q)-fc*sign(qp))/Ip;
%-------------------------------------------------------------------------%    
%qpp=(tau-b*qp-m*g*lc*sin(q)-fc*tanh(10000*qp))/Ip;
qpp=(tau-b*qp-m*g*lc*sin(q))/Ip;
%qpp=(tau-b*qp-m*g*lc*sin(q))/Ip;
%Vector de salida --------------------------------------------------------%
    xp=[qp;    %xp(1)=x(2) velocidad articular
           qpp];  %xp(2)=qpp  aceleración articular
%-------------------------------------------------------------------------%
end

function [xp,taus] =robot2gdl(t,x)
    q1=x(1); 
    q2=x(2); 
    q = [q1;q2]; %vector de posicion articular
    
    qp1=x(3); 
    qp2=x(4); 
    
    qp = [qp1;qp2];%vector de velocidad articular
    M=[2.351+0.1676*cos(q2),  0.102+0.0838*cos(q2);0.102+0.0838*cos(q2), 0.102];

    %matriz de fuerzas centripetas y de Coriolis
    C=[-0.1676*sin(q2)*qp2, -0.0838*sin(q2)*qp2;
    0.084*sin(q2)*qp1,    0.0];

    %par gravitacional
    gq=9.81*[3.9211*sin(q1)+0.1862*sin(q1+q2); 
    0.1862*sin(q1+q2)];

    fr=[2.288*qp1;
    0.175*qp2]; 
    [~,tau]=alg_control(t,q,qp);  %  
    %ecuacion en lazo cerrado
    qpp = M^(-1)*(tau-C*qp-gq-fr);

    %vector de estados 
    xp = [qp1; 
        qp2; 
        qpp(1);
        qpp(2);];
end
